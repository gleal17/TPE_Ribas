#!/usr/bin/env julia

neededPackages = [:PDDL, :SymbolicPlanners]
using Pkg;
for neededpackage in neededPackages
    (String(neededpackage) in keys(Pkg.project().dependencies)) || Pkg.add(String(neededpackage))
    @eval using $neededpackage
end

using PDDL, SymbolicPlanners

function print_help()
        println("usage: planner.jl <domain> <problem>")
        println("environment variables:")
        println("  HEURISTIC: HADD,HMAX,FF (default: HADD)")
        println("  GOAL: MIN_STEPS,MIN_METRIC,MAX_METRIC (default: MIN_STEPS)")
        println("  PLANNER: FORWARD,UNIFORM,GREEDY,ASTAR (default: ASTAR)")
        println("  TIMEOUT: <seconds> (default: 300)")
end

function get_heuristic()
        heuristic = get(ENV, "HEURISTIC", "HADD")
        if heuristic == "HADD"
                return HAdd()
        elseif heuristic == "HMAX"
                return HMax()
        elseif heuristic == "FF"
                return FFHeuristic()
        else
                println("Unknown heuristic $heuristic")
                print_help()
                exit(1)
        end
end

function get_goal(problem)
        goal = get(ENV, "GOAL", "MIN_METRIC")
        if goal == "MIN_STEPS"
                return MinStepsGoal(problem)
        elseif goal == "MIN_METRIC"
                return MinMetricGoal(problem)
        elseif goal == "MAX_METRIC"
                return MaxMetricGoal(problem)
        else
                println("Unknown goal $goal")
                print_help()
                exit(1)
        end
end

function get_planner(heuristic, timeout)
    planner = get(ENV, "PLANNER", "ASTAR")
    if planner == "ASTAR"
            return AStarPlanner(heuristic, max_time=timeout, save_search=true)
    elseif planner == "FORWARD"
            return ForwardPlanner(heuristic=heuristic, max_time=timeout, save_search=true)
    elseif planner == "GREEDY"
            return GreedyPlanner(heuristic, max_time=timeout, save_search=true)
    elseif planner == "UNIFORM"
            return UniformPlanner(max_time = timeout, save_search=true)
    else
            println("Unknown planner $planner")
            print_help()
            exit(1)
    end
end

function get_timeout()
    timeout = get(ENV, "TIMEOUT", "300")
    return parse(Int, timeout)
end

function main()
    if length(ARGS) != 2
            print_help()
            exit(1)
    end

    domain = load_domain(ARGS[1])
    problem = load_problem(ARGS[2])
    state = initstate(domain, problem)

    spec = get_goal(problem)
    heuristic = get_heuristic()
    timeout = get_timeout()
    planner = get_planner(heuristic, timeout)

    println("starting execution...")
    stats = @timed begin
            solution = planner(domain, state, spec)
    end

    println("solution found:")
    map(x -> println(write_pddl(x)), solution)
    println()
    println("time: $(stats.time) seconds")
end

main()


