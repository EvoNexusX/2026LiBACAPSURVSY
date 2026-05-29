# Metaheuristics for Uncertain BACAP

This repository organizes literature on **uncertain BACAP** (Berth Allocation and Quay Crane Assignment Problem), with a focus on **metaheuristic methods**.  
The literature is divided into two main groups:

- **Base Metaheuristics (No Explicit Robustness)**  
  The problem setting involves uncertainty, dynamics, disruption, stochastic arrivals, or reactive rescheduling, but the method itself does not explicitly build robustness into evaluation, selection, or recovery.
- **Robust Metaheuristics (With Explicit Robust Strategies)**  
  The method explicitly incorporates robust evaluation, robust search guidance, feasibility recovery, recourse, or uncertainty-aware decision mechanisms.

---

## Tag Legend

### Metaheuristics for Uncertain BACAP tags

- <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span>  
  Base metaheuristics without explicit robustness design

- <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span>  
  Metaheuristics with explicit robustness-oriented mechanisms

- <span style="background:#e67e22;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">GA</span>  
  Genetic algorithm

- <span style="background:#d35400;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">ACO</span>  
  Ant colony optimization

- <span style="background:#7f8c8d;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Memetic</span>  
  Memetic / hybrid local-improvement framework

- <span style="background:#2980b9;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">MOEA</span>  
  Multi-objective evolutionary/metaheuristic method

- <span style="background:#ad1457;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Hybrid</span>  
  Hybrid metaheuristics

- <span style="background:#2c3e50;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">RL</span>  
  Reinforcement learning or learning-assisted search

- <span style="background:#f39c12;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Expected</span>  
  Expected-performance evaluation

- <span style="background:#8e44ad;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Worst-Case</span>  
  Worst-case or min-max evaluation

- <span style="background:#c2185b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Risk/Stability</span>  
  Risk-, regret-, or stability-aware robustness

- <span style="background:#6a1b9a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">DRO</span>  
  Distributionally robust optimization

- <span style="background:#00897b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Recourse</span>  
  Recourse-aware / time-adaptive mechanism

- <span style="background:#ef6c00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploration</span>  
  Robust exploration

- <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span>  
  Robust exploitation

- <span style="background:#3949ab;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Adaptive</span>  
  Adaptive search regulation

- <span style="background:#546e7a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Penalty</span>  
  Penalty-based feasibility control

- <span style="background:#1e88e5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Repair</span>  
  Repair-based restoration

- <span style="background:#6d4c41;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Decoder</span>  
  Representation / decoder-integrated feasibility handling

- <span style="background:#2e7d32;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Feasibility</span>  
  Recourse / robust feasibility coordination

- <span style="background:#039be5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Scenario</span>  
  Scenario-based uncertainty modeling

- <span style="background:#7cb342;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Set-Based</span>  
  Set-based / interval-based uncertainty

- <span style="background:#fbc02d;color:black;padding:2px 6px;border-radius:4px;font-size:0.9em;">Fuzzy</span>  
  Fuzzy-based uncertainty

- <span style="background:#26a69a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Distribution</span>  
  Distribution-based uncertainty

- <span style="background:#ab47bc;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Ambiguity</span>  
  Distributional ambiguity

---

## A. Base Metaheuristics (No Explicit Robustness)

### A1. Genetic Algorithm (GA)

- **Han et al.**: "The algorithm for berth scheduling problem by the hybrid optimization strategy GASA," 2006. <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#e67e22;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">GA</span>
- **Arango et al.**: "Genetic algorithm for the dynamic berth allocation problem in real time," 2013. [Paper](https://doi.org/10.1016/B978-0-12-405163-8.00017-X) <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#e67e22;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">GA</span>
- **Tsai et al.**: "A novel wharf-based genetic algorithm for berth allocation planning," 2015. [Paper](https://dl.acm.org/doi/10.1145/2818869.2818900) <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#e67e22;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">GA</span>
- **Yu et al.**: "A genetic algorithm based on spatiotemporal conflict between continuous berth-allocation and time-varying specific crane assignment," 2019. <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#e67e22;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">GA</span>
- **Hu et al.**: "An Improved Genetic Algorithm for Berth Scheduling at Bulk Terminal," 2022. [Paper](https://doi.org/10.32604/csse.2022.029230) <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#e67e22;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">GA</span>
- **Al Samrout et al.**: "An improved genetic algorithm for the berth scheduling with ship-to-ship transshipment operations integrated model," 2024. [Paper](https://doi.org/10.1016/j.cor.2023.106409) <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#e67e22;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">GA</span>
- **Zhao et al.**: "DHMoGA BQCS: A Dynamic Heuristic Multi-Objective Genetic Algorithm for Berth Allocation and Quay Crane Assignment," 2026. <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#e67e22;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">GA</span> <span style="background:#2980b9;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">MOEA</span>

### A2. Ant Colony Optimization (ACO)

- **Tong et al.**: "Ant colony optimization for the ship berthing problem," 1999. [Paper](https://doi.org/10.1007/3-540-46674-6_30) <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#d35400;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">ACO</span>
- **Cheong and Tan**: "A multi-objective multi-colony ant algorithm for solving the berth allocation problem," 2008. [Paper](https://link.springer.com/chapter/10.1007/978-3-540-87333-6_4) <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#d35400;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">ACO</span> <span style="background:#2980b9;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">MOEA</span>
- **Yu and Wang**: "The Application Research of Container Berth Allocation Based on Ant Colony Algorithms," 2011. [Paper](https://ascelibrary.org/doi/10.1061/41184%28419%29250) <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#d35400;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">ACO</span>
- **Azza et al.**: "Ant colony system for solving quay crane scheduling problem in container terminal," 2014. [Paper](https://ieeexplore.ieee.org/document/6971695) <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#d35400;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">ACO</span>
- **Wang et al.**: "An adaptive ant colony system based on variable range receding horizon control for berth allocation problem," 2022. [Paper](https://doi.org/10.1109/TITS.2022.3167456) <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#d35400;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">ACO</span> <span style="background:#3949ab;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Adaptive</span>
- **Yu et al.**: "Enhanced ant colony algorithm for discrete dynamic berth allocation," 2023. [Paper](https://doi.org/10.3390/jmse11101931) <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#d35400;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">ACO</span>

### A3. Memetic Algorithms

- **Dulebenets**: "A Diffused Memetic Optimizer for reactive berth allocation and scheduling at marine container terminals in response to disruptions," 2023. [Paper](https://doi.org/10.1016/j.swevo.2023.101334) <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#7f8c8d;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Memetic</span>
- **Xu et al.**: "Continuous berth allocation and time-variant quay crane assignment: Memetic algorithm with a heuristic decoding method," 2025. <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#7f8c8d;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Memetic</span>

### A4. Multi-objective Metaheuristics

- **Ji et al.**: "An enhanced NSGA-II for solving berth allocation and quay crane assignment problem with stochastic arrival times," 2022. [Paper](https://doi.org/10.1109/TITS.2022.3213834) <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#2980b9;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">MOEA</span> <span style="background:#039be5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Scenario</span>
- **Hu**: "Multi-objective genetic algorithm for berth allocation problem considering daytime preference," 2015. <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#e67e22;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">GA</span> <span style="background:#2980b9;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">MOEA</span>
- **Cheong and Tan**: "A multi-objective multi-colony ant algorithm for solving the berth allocation problem," 2008. <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#d35400;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">ACO</span> <span style="background:#2980b9;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">MOEA</span>
- **Li et al.**: "A bi-objective optimization for integrated berth allocation and quay crane assignment with preventive maintenance activities," 2020. <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#2980b9;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">MOEA</span>

### A5. Hybrid Metaheuristics

- **Correcher and Alvarez-Valdes**: "A biased random-key genetic algorithm for the time-invariant berth allocation and quay crane assignment problem," 2017. [Paper](https://doi.org/10.1016/j.eswa.2017.07.028) <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#ad1457;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Hybrid</span>
- **Chaves et al.**: "An adaptive biased random-key genetic algorithm for the tactical berth allocation problem," 2024. [Paper](https://www.researchgate.net/publication/380768481_An_adaptive_biased_random-key_genetic_algorithm_for_the_tactical_berth_allocation_problem) <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#ad1457;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Hybrid</span> <span style="background:#3949ab;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Adaptive</span>
- **De et al.**: "A hybrid dynamic berth allocation planning problem with fuel costs using chemical reaction optimization," 2020. [Paper](https://eprints.ncl.ac.uk/252070) <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#ad1457;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Hybrid</span>
- **Ji et al.**: "Hybrid rolling-horizon optimization for berth allocation and quay crane assignment with unscheduled vessels," 2022. [Paper](https://doi.org/10.1016/j.aei.2022.101733) <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#ad1457;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Hybrid</span>
- **Wu and Zhu**: "Integrated proactive-reactive approach and a hybrid adaptive large neighborhood search algorithm for berth and quay crane scheduling under uncertain combination," 2023. <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#ad1457;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Hybrid</span> <span style="background:#3949ab;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Adaptive</span>
- **Jo and Moon**: "A hierarchical reinforcement learning approach for real-time berth allocation and quay crane scheduling," 2025. [Paper](https://doi.org/10.1080/00207543.2025.2542518) <span style="background:#b36b00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Base</span> <span style="background:#ad1457;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Hybrid</span> <span style="background:#2c3e50;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">RL</span>

---

## B. Robust Metaheuristics (With Explicit Robust Strategies)

### B1. Robust Evaluation & Selection

#### B1.1 Expected Performance

- **Ji et al.**: "An enhanced NSGA-II for solving berth allocation and quay crane assignment problem with stochastic arrival times," 2022. [Paper](https://doi.org/10.1109/TITS.2022.3213834) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#f39c12;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Expected</span> <span style="background:#039be5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Scenario</span>
- **Tan et al.**: "Berth allocation and quay crane assignment under uncertainties," 2020. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#f39c12;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Expected</span> <span style="background:#039be5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Scenario</span>
- **Zheng et al.**: "Integrated rescheduling optimization of berth allocation and quay crane allocation with shifting strategies," 2024. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#f39c12;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Expected</span> <span style="background:#1e88e5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Repair</span>

#### B1.2 Worst-case Evaluation

- **Xu et al.**: "Robust berth scheduling with uncertain vessel delay and handling time," 2012. [Paper](https://doi.org/10.1007/s10479-011-1050-x) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#8e44ad;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Worst-Case</span>
- **Shang et al.**: "A robust optimization approach to the integrated berth allocation and quay crane assignment problem," 2016. [Paper](https://doi.org/10.1016/j.tre.2016.06.011) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#8e44ad;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Worst-Case</span> <span style="background:#7cb342;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Set-Based</span>
- **Rodrigues and Agra**: "An exact robust approach for the integrated berth allocation and quay crane scheduling problem under uncertain arrival times," 2021. [Paper](https://doi.org/10.1016/j.tre.2021.102524) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#8e44ad;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Worst-Case</span> <span style="background:#7cb342;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Set-Based</span>
- **Liu et al.**: "A two-stage robust optimization approach for the berth allocation problem under uncertainty," 2020. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#8e44ad;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Worst-Case</span> <span style="background:#00897b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Recourse</span>

#### B1.3 Risk / Regret / Stability

- **Xiang et al.**: "A bi-objective robust model for berth allocation scheduling under uncertainty," 2017. [Paper](https://doi.org/10.1016/j.tre.2017.07.006) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#c2185b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Risk/Stability</span>
- **Wang et al.**: "Robust metaheuristics under uncertainty for berth allocation and quay crane assignment: A review," 2024. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#c2185b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Risk/Stability</span>
- **Iris and Lam**: "Recoverable robustness in weekly berth and quay crane planning," 2019. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#c2185b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Risk/Stability</span> <span style="background:#00897b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Recourse</span>

#### B1.4 Distributionally Robust

- **Agra and Rodrigues**: "Distributionally robust optimization for the berth allocation problem under uncertainty," 2022. [Paper](https://doi.org/10.1016/j.trb.2022.08.001) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#6a1b9a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">DRO</span> <span style="background:#ab47bc;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Ambiguity</span>
- **Wang et al.**: "Optimizing integrated berth allocation and quay crane assignment: A distributionally robust approach," 2025. [Paper](https://doi.org/10.1016/j.ejor.2024.06.040) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#6a1b9a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">DRO</span> <span style="background:#ab47bc;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Ambiguity</span>
- **Wang et al.**: "Distributionally robust chance-constrained optimization for the integrated berth allocation and quay crane assignment problem," 2024. [Paper](https://doi.org/10.1016/j.cor.2024.106786) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#6a1b9a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">DRO</span> <span style="background:#ab47bc;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Ambiguity</span>

#### B1.5 Recourse-aware / Time-adaptive

- **Qu et al.**: "Two-stage robust programming modeling for continuous berth allocation with uncertain vessel arrival time," 2023. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#00897b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Recourse</span>
- **Tan and He**: "Integrated proactive and reactive strategies for sustainable berth allocation and quay crane assignment under uncertainty," 2025. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#00897b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Recourse</span>
- **Wang et al.**: "Robust metaheuristics under uncertainty for berth allocation and quay crane assignment: A review," 2024. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#00897b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Recourse</span>

### B2. Robust Search Strategies

#### B2.1 Robust Exploration

- **Wu et al.**: "Ternary Historical Memory-Based Robust Clustered Particle Swarm Optimization for Dynamic Berth Allocation and Crane Assignment Problem," 2025. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#ef6c00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploration</span> <span style="background:#8e44ad;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">PSO</span>
- **Xiang et al.**: "A bi-objective robust model for berth allocation scheduling under uncertainty," 2017. [Paper](https://doi.org/10.1016/j.tre.2017.07.006) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#ef6c00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploration</span>
- **Liang et al.**: "Hybrid genetic algorithm and Q-learning-based solution for the time-variant berth and quay crane allocation problem," 2025. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#ef6c00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploration</span> <span style="background:#2c3e50;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">RL</span>
- **Alsoufi et al.**: "Robust berth allocation using a hybrid approach combining branch-and-cut and the genetic algorithm," 2016. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#ef6c00;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploration</span> <span style="background:#ad1457;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Hybrid</span>

#### B2.2 Robust Exploitation

- **Xu et al.**: "Robust berth scheduling with uncertain vessel delay and handling time," 2012. [Paper](https://doi.org/10.1007/s10479-011-1050-x) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span>
- **Ji et al.**: "An enhanced NSGA-II for solving berth allocation and quay crane assignment problem with stochastic arrival times," 2022. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span> <span style="background:#2980b9;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">MOEA</span>
- **Shang et al.**: "A robust optimization approach to the integrated berth allocation and quay crane assignment problem," 2016. [Paper](https://doi.org/10.1016/j.tre.2016.06.011) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span>
- **Tan and He**: "Integrated proactive and reactive strategies for sustainable berth allocation and quay crane assignment under uncertainty," 2025. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span> <span style="background:#00897b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Recourse</span>
- **Wu et al.**: "Ternary Historical Memory-Based Robust Clustered Particle Swarm Optimization for Dynamic Berth Allocation and Crane Assignment Problem," 2025. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span> <span style="background:#8e44ad;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">PSO</span>
- **Rodriguez-Molins et al.**: "A genetic algorithm for robust berth allocation and quay crane assignment," 2014. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span> <span style="background:#e67e22;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">GA</span>
- **Wang et al.**: "A proactive-reactive-based approach for continuous berth allocation and quay crane assignment problems with hybrid uncertainty," 2024. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span> <span style="background:#00897b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Recourse</span>
- **Qu et al.**: "Two-stage robust programming modeling for continuous berth allocation with uncertain vessel arrival time," 2023. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span> <span style="background:#00897b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Recourse</span>
- **Xiang et al.**: "A bi-objective robust model for berth allocation scheduling under uncertainty," 2017. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span>
- **Park et al.**: "Particle swarm optimization algorithm with time buffer insertion for robust berth scheduling," 2021. [Paper](https://doi.org/10.1016/j.cie.2021.107585) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span> <span style="background:#8e44ad;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">PSO</span>
- **Nourmohammadzadeh and Voß**: "Robust Optimisation for an Integrated Model of Berth and Quay Crane Assignment at Maritime Container Terminals Respecting Uncertain Numbers of Quay Cranes," 2024. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span>
- **Alsoufi et al.**: "Robust berth allocation using a hybrid approach combining branch-and-cut and the genetic algorithm," 2016. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span> <span style="background:#ad1457;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Hybrid</span>
- **Dai et al.**: "A bi-layer model for berth allocation problem based on proactive-reactive strategy," 2023. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span>
- **Liu et al.**: "A decision model for berth allocation under uncertainty considering service level using an adaptive differential evolution algorithm," 2016. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span> <span style="background:#16a085;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">DE</span>
- **Guo et al.**: "Berth allocation problem with uncertain vessel handling times considering weather conditions," 2021. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span>
- **Rodriguez-Molins et al.**: "Robust scheduling for berth allocation and quay crane assignment problem," 2014. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span>
- **Zhen**: "Tactical berth allocation under uncertainty," 2015. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#5d4037;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Exploitation</span>

#### B2.3 Adaptive Search Regulation

- **Ji et al.**: "An enhanced NSGA-II for solving berth allocation and quay crane assignment problem with stochastic arrival times," 2022. [Paper](https://doi.org/10.1109/TITS.2022.3213834) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#3949ab;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Adaptive</span> <span style="background:#2980b9;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">MOEA</span>
- **Wang et al.**: "A proactive-reactive-based approach for continuous berth allocation and quay crane assignment problems with hybrid uncertainty," 2024. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#3949ab;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Adaptive</span>
- **Qu et al.**: "Two-stage robust programming modeling for continuous berth allocation with uncertain vessel arrival time," 2023. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#3949ab;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Adaptive</span> <span style="background:#00897b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Recourse</span>
- **Xiang et al.**: "A bi-objective robust model for berth allocation scheduling under uncertainty," 2017. [Paper](https://doi.org/10.1016/j.tre.2017.07.006) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#3949ab;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Adaptive</span>
- **Park et al.**: "Particle swarm optimization algorithm with time buffer insertion for robust berth scheduling," 2021. [Paper](https://doi.org/10.1016/j.cie.2021.107585) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#3949ab;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Adaptive</span> <span style="background:#8e44ad;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">PSO</span>
- **Liang et al.**: "Hybrid genetic algorithm and Q-learning-based solution for the time-variant berth and quay crane allocation problem," 2025. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#3949ab;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Adaptive</span> <span style="background:#2c3e50;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">RL</span>
- **Dai et al.**: "A bi-layer model for berth allocation problem based on proactive-reactive strategy," 2023. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#3949ab;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Adaptive</span>
- **Liu et al.**: "A decision model for berth allocation under uncertainty considering service level using an adaptive differential evolution algorithm," 2016. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#3949ab;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Adaptive</span> <span style="background:#16a085;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">DE</span>
- **Guo et al.**: "Berth allocation problem with uncertain vessel handling times considering weather conditions," 2021. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#3949ab;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Adaptive</span>
- **Wu and Zhu**: "Integrated proactive-reactive approach and a hybrid adaptive large neighborhood search algorithm for berth and quay crane scheduling under uncertain combination," 2023. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#3949ab;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Adaptive</span> <span style="background:#ad1457;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Hybrid</span>

### B3. Robust Feasibility & Recovery

#### B3.1 Penalty-based

- **Jia et al.**: "A simulation optimization method for deep-sea vessel berth planning and feeder arrival scheduling at a container port," 2020. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#546e7a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Penalty</span>
- **Xiang and Liu**: "An almost robust optimization model for integrated berth allocation and quay crane assignment problem," 2021. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#546e7a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Penalty</span>
- **Zhou and Kang**: "Simulation optimization for berth allocation," 2008. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#546e7a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Penalty</span>
- **Xiang et al.**: "A bi-objective robust model for berth allocation scheduling under uncertainty," 2017. [Paper](https://doi.org/10.1016/j.tre.2017.07.006) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#546e7a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Penalty</span>
- **Liu et al.**: "A decision model for berth allocation under uncertainty considering service level using an adaptive differential evolution algorithm," 2016. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#546e7a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Penalty</span>
- **Şahin and Kuvvetli**: "Differential evolution based meta-heuristic algorithm for dynamic continuous berth allocation," 2016. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#546e7a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Penalty</span> <span style="background:#16a085;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">DE</span>
- **Aslam et al.**: "Berth allocation considering multiple quays: A practical approach using cuckoo search optimization," 2023. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#546e7a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Penalty</span>

#### B3.2 Repair-based

- **Zheng et al.**: "The integrated rescheduling problem of berth allocation and quay crane assignment with uncertainty," 2023. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#1e88e5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Repair</span>
- **Zheng et al.**: "Integrated rescheduling optimization of berth allocation and quay crane allocation with shifting strategies," 2024. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#1e88e5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Repair</span>
- **Zou et al.**: "Swarm optimization based adaptive repair for uncertain BACAP," 2024. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#1e88e5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Repair</span>
- **Li et al.**: "Real-time disruption recovery for integrated berth allocation and crane assignment in container terminals," 2015. [Paper](https://journals.sagepub.com/doi/10.3141/2479-07) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#1e88e5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Repair</span>
- **Xiang et al.**: "Reactive strategy for discrete berth allocation and quay crane assignment problems under uncertainty," 2018. [Paper](https://doi.org/10.1016/j.cie.2018.09.020) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#1e88e5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Repair</span>
- **Ma et al.**: "A fast heuristic for disruption-oriented berth adjustment," 2015. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#1e88e5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Repair</span>

#### B3.3 Representation / Decoder-integrated

- **Rodriguez-Molins et al.**: "A genetic algorithm for robust berth allocation and quay crane assignment," 2014. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#6d4c41;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Decoder</span>
- **Wang et al.**: "A proactive-reactive-based approach for continuous berth allocation and quay crane assignment problems with hybrid uncertainty," 2024. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#6d4c41;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Decoder</span>
- **Dai et al.**: "A bi-layer model for berth allocation problem based on proactive-reactive strategy," 2023. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#6d4c41;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Decoder</span>
- **Liu et al.**: "A decision model for berth allocation under uncertainty considering service level using an adaptive differential evolution algorithm," 2016. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#6d4c41;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Decoder</span>
- **Zhen and Chang**: "A bi-objective model for robust berth allocation scheduling," 2012. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#6d4c41;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Decoder</span>
- **Vacca et al.**: "An exact algorithm for the integrated planning of berth allocation and quay crane assignment," 2013. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#6d4c41;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Decoder</span>
- **Iris et al.**: "Integrated berth allocation and quay crane assignment problem: Set partitioning models and computational results," 2015. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#6d4c41;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Decoder</span>

#### B3.4 Recourse / Robust Feasibility Coordination

- **Wang et al.**: "Robust metaheuristics under uncertainty for berth allocation and quay crane assignment: A review," 2024. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#2e7d32;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Feasibility</span>
- **Ji et al.**: "An enhanced NSGA-II for solving berth allocation and quay crane assignment problem with stochastic arrival times," 2022. [Paper](https://doi.org/10.1109/TITS.2022.3213834) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#2e7d32;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Feasibility</span>
- **Tan and He**: "Integrated proactive and reactive strategies for sustainable berth allocation and quay crane assignment under uncertainty," 2025. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#2e7d32;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Feasibility</span>
- **Rodrigues and Agra**: "An exact robust approach for the integrated berth allocation and quay crane scheduling problem under uncertain arrival times," 2021. [Paper](https://doi.org/10.1016/j.tre.2021.102524) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#2e7d32;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Feasibility</span>
- **Wang et al.**: "Distributionally robust chance-constrained optimization for the integrated berth allocation and quay crane assignment problem," 2024. [Paper](https://doi.org/10.1016/j.cor.2024.106786) <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#2e7d32;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Feasibility</span> <span style="background:#6a1b9a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">DRO</span>
- **Iris and Lam**: "Recoverable robustness in weekly berth and quay crane planning," 2019. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#2e7d32;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Feasibility</span> <span style="background:#00897b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Recourse</span>
- **Qu et al.**: "Two-stage robust programming modeling for continuous berth allocation with uncertain vessel arrival time," 2023. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#2e7d32;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Feasibility</span> <span style="background:#00897b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Recourse</span>
- **Xiang and Liu**: "An expanded robust optimisation approach for the berth allocation problem considering uncertain operation time," 2021. <span style="background:#c0392b;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Robust</span> <span style="background:#2e7d32;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Feasibility</span>

### B4. Uncertainty Modeling

#### B4.1 Scenario-based

- **Ji et al.**: "An enhanced NSGA-II for solving berth allocation and quay crane assignment problem with stochastic arrival times," 2022. [Paper](https://doi.org/10.1109/TITS.2022.3213834) <span style="background:#039be5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Scenario</span>
- **Wu et al.**: "Ternary Historical Memory-Based Robust Clustered Particle Swarm Optimization for Dynamic Berth Allocation and Crane Assignment Problem," 2025. <span style="background:#039be5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Scenario</span>
- **Ma et al.**: "Stochastic programming approach for unidirectional quay crane scheduling problem with uncertainty," 2021. <span style="background:#039be5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Scenario</span>
- **Tan et al.**: "Berth allocation and quay crane assignment under uncertainties," 2020. <span style="background:#039be5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Scenario</span>
- **Zheng et al.**: "Integrated rescheduling optimization of berth allocation and quay crane allocation with shifting strategies," 2024. <span style="background:#039be5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Scenario</span>
- **Chu et al.**: "Optimization of Integrated Tugboat-Berth-Quay Crane Scheduling in Container Ports Considering Uncertainty in Vessel Arrival Times and Berthing Preferences," 2024. <span style="background:#039be5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Scenario</span>
- **Jiang et al.**: "Integrated berth and crane scheduling problem considering crane coverage in multi-terminal tidal ports under uncertainty," 2022. <span style="background:#039be5;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Scenario</span>

#### B4.2 Set-based / Interval-based

- **Rodrigues and Agra**: "An exact robust approach for the integrated berth allocation and quay crane scheduling problem under uncertain arrival times," 2021. [Paper](https://doi.org/10.1016/j.tre.2021.102524) <span style="background:#7cb342;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Set-Based</span>
- **Kolley et al.**: "Robust berth scheduling using machine learning for vessel arrival time prediction," 2023. <span style="background:#7cb342;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Set-Based</span>
- **Chargui et al.**: "Berth allocation and crane assignment under constrained uncertainty," 2023. <span style="background:#7cb342;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Set-Based</span>
- **Liu et al.**: "A two-stage robust optimization approach for the berth allocation problem under uncertainty," 2020. <span style="background:#7cb342;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Set-Based</span>
- **Xiang and Liu**: "An almost robust optimization model for integrated berth allocation and quay crane assignment problem," 2021. <span style="background:#7cb342;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Set-Based</span>

#### B4.3 Fuzzy-based

- **Segura et al.**: "A fully fuzzy linear programming model to the berth allocation problem," 2017. <span style="background:#fbc02d;color:black;padding:2px 6px;border-radius:4px;font-size:0.9em;">Fuzzy</span>
- **Gutierrez et al.**: "Fully fuzzy linear programming model for the berth allocation problem with two quays," 2019. <span style="background:#fbc02d;color:black;padding:2px 6px;border-radius:4px;font-size:0.9em;">Fuzzy</span>
- **Lujan et al.**: "A fuzzy optimization model for the berth allocation problem and quay crane allocation problem (BAP+QCAP) with n quays," 2021. <span style="background:#fbc02d;color:black;padding:2px 6px;border-radius:4px;font-size:0.9em;">Fuzzy</span>
- **Perez-Canedo et al.**: "A multi-objective berth allocation problem in fuzzy environment," 2022. <span style="background:#fbc02d;color:black;padding:2px 6px;border-radius:4px;font-size:0.9em;">Fuzzy</span>

#### B4.4 Distribution-based

- **Han et al.**: "A proactive approach for simultaneous berth and quay crane scheduling problem with stochastic arrival and handling time," 2010. <span style="background:#26a69a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Distribution</span>
- **Yan et al.**: "A dynamic and flexible berth allocation model with stochastic vessel arrival times," 2019. <span style="background:#26a69a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Distribution</span>
- **Schepler et al.**: "The stochastic discrete berth allocation problem," 2019. <span style="background:#26a69a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Distribution</span>
- **Umang et al.**: "Real-time management of berth allocation with stochastic vessel arrivals," 2017. <span style="background:#26a69a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Distribution</span>
- **Budipriyanto et al.**: "A stochastic berth allocation model with uncertain service process," 2017. <span style="background:#26a69a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Distribution</span>
- **Jia et al.**: "A simulation optimization method for deep-sea vessel berth planning and feeder arrival scheduling at a container port," 2020. <span style="background:#26a69a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Distribution</span>
- **Ursavas and Zhu**: "Optimization of berth scheduling under stochastic operational environments," 2016. <span style="background:#26a69a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Distribution</span>
- **Zhou and Kang**: "Simulation optimization for berth allocation," 2008. <span style="background:#26a69a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Distribution</span>

#### B4.5 Distributional Ambiguity

- **Agra and Rodrigues**: "Distributionally robust optimization for the berth allocation problem under uncertainty," 2022. [Paper](https://doi.org/10.1016/j.trb.2022.08.001) <span style="background:#ab47bc;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Ambiguity</span> <span style="background:#6a1b9a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">DRO</span>
- **Rodrigues and Agra**: "Handling uncertainty in the quay crane scheduling problem: a unified distributionally robust decision model," 2024. <span style="background:#ab47bc;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Ambiguity</span> <span style="background:#6a1b9a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">DRO</span>
- **Wang et al.**: "Optimizing integrated berth allocation and quay crane assignment: A distributionally robust approach," 2025. [Paper](https://doi.org/10.1016/j.ejor.2024.06.040) <span style="background:#ab47bc;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Ambiguity</span> <span style="background:#6a1b9a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">DRO</span>
- **Wang et al.**: "Distributionally robust chance-constrained optimization for the integrated berth allocation and quay crane assignment problem," 2024. [Paper](https://doi.org/10.1016/j.cor.2024.106786) <span style="background:#ab47bc;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Ambiguity</span> <span style="background:#6a1b9a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">DRO</span>
- **Tang et al.**: "Distributionally robust programming of berth-allocation-with-crane-allocation problem with uncertain quay-crane-handling efficiency," 2023. <span style="background:#ab47bc;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">Ambiguity</span> <span style="background:#6a1b9a;color:white;padding:2px 6px;border-radius:4px;font-size:0.9em;">DRO</span>

---

## Notes

- Some papers naturally belong to **multiple categories**.
- The current grouping is built from the literature already present in your `ref.bib` and discussed in `TITS_template.tex`.
- The same paper may appear in multiple places because this README is intended as a **taxonomy-oriented index**, not a de-duplicated bibliography.

---

# Robust BACAP Experiment Code

This directory contains the MATLAB code used for the experimental part of the paper. It focuses on the Berth Allocation and Quay Crane Allocation Problem (BACAP) under uncertainty. The codebase is mainly organized into four parts: algorithm implementations, benchmark and data-generation scripts, parallel experiment scripts, and shared utility modules.

## Directory Structure

```text
Main Code/
|-- Algorithm/
|   |-- C7_1.m
|   |-- C8_1.m
|   `-- C9_1.m
|-- Benchmark/
|   |-- Arrival Simulation.m
|   |-- benchmark.m
|   |-- evaluate_robustness.m
|   `-- generate_separate_csv_for_vessels_and_berths_text_compliant.m
|-- Experiment/
|   `-- test_3_flat.m
|-- Modules/
|   |-- load_data.m
|   |-- generate_scenarios.m
|   |-- decode_solution.m
|   |-- check_constraints.m
|   |-- assign_qcs.m
|   |-- evaluate_fitness_minmax.m
|   |-- evaluate_fitness_expectation.m
|   |-- evaluate_fitness_adjustable.m
|   `-- visualize_solution.m
`-- readme.md
```

## Folder Description

### 1. `Algorithm`

The `Algorithm` folder contains the main programs that combine basic metaheuristic algorithms with robust strategies. The overall research idea is to integrate three basic metaheuristics with different robust decision strategies for solving BACAP instances under uncertainty.

The current directory includes scripts such as:

- `C7_1.m`
- `C8_1.m`
- `C9_1.m`

These scripts serve as executable main functions for specific algorithm-strategy combinations. Their main tasks include:

- reading vessel and quay crane data;
- generating uncertainty scenarios;
- optimizing solutions through the corresponding fitness evaluation functions;
- decoding the final solution into berth and quay crane assignments;
- exporting the results.

Based on the current implementation, the robust strategies mainly correspond to the following evaluation modes:

- `evaluate_fitness_minmax.m`: min-max or worst-case robust evaluation;
- `evaluate_fitness_expectation.m`: expectation-based robust evaluation;
- `evaluate_fitness_adjustable.m`: adjustable robust evaluation.

Note: the batch experiment script `Experiment/test_3_flat.m` is written in the format `C1_1` to `C9_1`, so in the complete framework this folder represents combinations of three basic metaheuristic algorithms and multiple robust strategies.

### 2. `Benchmark`

The `Benchmark` folder is used for benchmark generation, arrival-pattern construction, and performance evaluation of algorithm outputs.

Main files include:

- `Arrival Simulation.m`  
  Used to generate different vessel arrival disturbance patterns. According to the current script, it supports four typical arrival modes:
  - uniform disturbance;
  - Gaussian disturbance;
  - chaotic disturbance;
  - periodic disturbance.

- `generate_separate_csv_for_ships_and_berths_text_compliant.m`  
  Used to generate vessel data, berth/quay crane data, and related uncertainty information. It serves as an important data generator for the experiments.

- `benchmark.m`  
  Used to evaluate the scheduling solutions produced by the algorithms. In the current implementation, it mainly computes:
  - average port time;
  - robustness-related performance values.

- `evaluate_robustness.m`  
  Used to calculate the robustness metric. In the current code, the robustness index is constructed based on factors such as tidal windows, berth conflicts, quay crane conflicts, and survival time.

Therefore, the `Benchmark` folder can be understood as the directory that contains the generator, the four vessel arrival patterns, and the evaluation metrics.

### 3. `Experiment`

The `Experiment` folder stores the scripts for batch experiments and parallel execution.

The core script is:

- `test_3_flat.m`

Its main functions include:

- building a task list for different datasets, algorithms, and repeated runs;
- using `parpool` and `parfor` for parallel computing;
- running each algorithm 25 times;
- reading the result file generated by each run;
- calling `benchmark.m` to compute evaluation metrics;
- aggregating and saving all experimental results.

This part is therefore the main implementation of the parallel 25-run experiment process.

### 4. `Modules`

The `Modules` folder contains shared code modules reused by the basic metaheuristic algorithms and their robust variants. These modules provide the lower-level support functions needed by the main algorithm scripts.

Main modules include:

- `load_data.m`: reads vessel and quay crane data;
- `generate_scenarios.m`: generates uncertainty scenarios;
- `decode_solution.m`: decodes an encoded solution into a scheduling plan;
- `check_constraints.m`: checks feasibility and constraint satisfaction;
- `assign_qcs.m`: handles quay crane assignment;
- `evaluate_fitness_minmax.m`, `evaluate_fitness_expectation.m`, `evaluate_fitness_adjustable.m`: compute fitness values under different robust strategies;
- `visualize_solution.m`: visualizes the scheduling result.

This folder can be viewed as the shared function library for the algorithm implementations.

## How to Run

It is recommended to run the code in MATLAB. For batch experiments, MATLAB Parallel Computing Toolbox is recommended.

A typical workflow is as follows:

1. Prepare the input data files for vessels, quay cranes, tidal windows, and other related information.
2. Modify the dataset settings, algorithm list, repetition count, and parallel parameters in `Experiment/test_3_flat.m` as needed.
3. To test a single algorithm, run the corresponding main script in the `Algorithm` folder.
4. To perform batch comparison experiments, run `Experiment/test_3_flat.m`.
5. Use the scripts in `Benchmark` to evaluate and analyze the generated scheduling results.

## Output Files

After running an algorithm, the output is typically saved in files named as follows:

```text
C*_1_result_d*_r*.csv
```

After all batch experiments are completed, `test_3_flat.m` further saves the aggregated results into a `.mat` file for later statistical analysis and figure generation.

## Notes

- This README describes the code structure inside the current `Main Code` directory only, rather than the entire paper project.
- The current experiment script still uses the naming pattern from `C1_1` to `C9_1`. If only part of the algorithms is kept in this directory, it is recommended to check the `algo_names` list and the corresponding `addpath` settings.
- Since different experiments may use different data file names, please verify the data paths and input formats used in `Algorithm`, `Benchmark`, and `Experiment` before running the code.
