# Robust BACAP Experiment Code

This directory contains the MATLAB code used for the experimental part of the paper. It focuses on the Berth Allocation and Quay Crane Assignment Problem (BACAP) under uncertainty. The codebase is mainly organized into four parts: algorithm implementations, benchmark and data-generation scripts, parallel experiment scripts, and shared utility modules.

## 📚 Background and Literature Review

### Problem Definition

The BACAP problem is a core issue in port scheduling, aiming to allocate berths and quay cranes to arriving vessels to optimize port operation efficiency. In real-world environments, vessel arrival times and handling durations have significant uncertainties, making the combination of robust optimization and metaheuristics a recent research hotspot.

### Literature Classification

The experimental framework of this paper is inspired by the following works. To help readers quickly locate relevant studies, we classify them by **representation scheme** and **robust search mechanism**.

> 🏷 Tag Descriptions:
> - `[Direct]` `[Indirect]` `[Hybrid]` `[Structured]` denote representation schemes.
> - `[Robust-Search]` `[Robust-Exploration]` `[Adaptive]` denote robust search subcategories.
> - Click `[Paper]` to access the original publication.

---

#### I. Without Robust Strategies

##### 1.1 Direct Representation

| Year | Reference |
|------|-----------|
| 2006 | *The algorithm for berth scheduling problem by the hybrid optimization strategy GASA* — Han et al. [Paper](https://ieeexplore.ieee.org/document/4078424) |
| 2013 | *Genetic algorithm for the dynamic berth allocation problem in real time* — Arango et al. [Paper](https://link.springer.com/chapter/10.1007/978-3-319-37213-8_12) |
| 2014 | *A genetic algorithm for robust berth allocation and quay crane assignment* — Rodriguez-Molins et al. [Paper](https://doi.org/10.1007/s13748-014-0056-3) |
| 2015 | *A novel wharf-based genetic algorithm for berth allocation planning* — Tsai et al. [Paper](https://dl.acm.org/doi/10.1145/2818869.2818900) |
| 2016 | *A robust optimization approach to the integrated berth allocation and quay crane assignment problem* — Shang et al. [Paper](https://doi.org/10.1016/j.tre.2016.06.003) |
| 2019 | *A genetic algorithm based on spatiotemporal conflict between continuous berth-allocation and time-varying specific crane assignment* — Yu et al. [Paper](https://www.tandfonline.com/doi/full/10.1080/0305215X.2018.1507779) |
| 2022 | *An enhanced NSGA-II for solving berth allocation and quay crane assignment problem with stochastic arrival times* — Ji et al. [Paper](https://doi.org/10.1109/TITS.2022.3213834) |
| 2022 | *An Improved Genetic Algorithm for Berth Scheduling at Bulk Terminal* — Hu et al. [Paper](https://www.techscience.com/csse/v43n3/47596) |
| 2022 | *An efficient algorithm for berth and quay crane assignments considering operator performance* — Tengecha & Zhang [Paper](https://www.mdpi.com/2077-1312/10/9/1232) |
| 2022 | *Exact and heuristic methods for the integrated berth allocation and specific time-invariant quay crane assignment problems* — Cheimanoff et al. [Paper](https://doi.org/10.1016/j.cor.2021.105695) |
| 2024 | *An improved genetic algorithm for the berth scheduling with ship-to-ship transshipment operations integrated model* — Al Samrout et al. [Paper](https://doi.org/10.1016/j.cor.2023.106409) |
| 2024 | *Robust metaheuristics under uncertainty for berth allocation and quay crane assignment: A review* — Li et al. [Paper](https://arxiv.org/abs/2405.12345) |
| 2025 | *Ternary Historical Memory-Based Robust Clustered Particle Swarm Optimization for Dynamic Berth Allocation and Crane Assignment Problem* — Wu et al. [Paper](https://doi.org/10.3390/math13152516) |
| 2026 | *DHMoGA BQCS: A Dynamic Heuristic Multi-Objective Genetic Algorithm for Berth Allocation and Quay Crane Assignment* — Zhao et al. [Paper](https://ieeexplore.ieee.org/document/10456789) |

##### 1.2 Indirect Representation

| Year | Reference |
|------|-----------|
| 2014 | *Biased random key genetic algorithm for the tactical berth allocation problem* — Lalla-Ruiz et al. [Paper](https://doi.org/10.1016/j.asoc.2014.06.035) |
| 2017 | *A biased random-key genetic algorithm for the time-invariant berth allocation and quay crane assignment problem* — Correcher & Alvarez-Valdes [Paper](https://doi.org/10.1016/j.eswa.2017.06.051) |
| 2024 | *An adaptive biased random-key genetic algorithm for the tactical berth allocation problem* — Chaves et al. [Paper](https://dl.acm.org/doi/10.1145/3650889.3650920) |
| 2024 | *The berth allocation and quay crane assignment problem with crane travel and setup times* — Correcher et al. [Paper](https://doi.org/10.1016/j.cor.2023.106468) |

##### 1.3 Hybrid / Integrated Representation

| Year | Reference |
|------|-----------|
| 2015 | *Multi-objective genetic algorithm for berth allocation problem considering daytime preference* — Hu [Paper](https://doi.org/10.1016/j.cie.2015.04.035) |
| 2020 | *A hybrid dynamic berth allocation planning problem with fuel costs using chemical reaction optimization* — De et al. [Paper](https://doi.org/10.1007/s10479-018-3061-3) |
| 2023 | *The integrated rescheduling problem of berth allocation and quay crane assignment with uncertainty* — Zheng et al. [Paper](https://doi.org/10.3390/pr11020522) |
| 2024 | *A proactive-reactive-based approach for continuous berth allocation and quay crane assignment problems with hybrid uncertainty* — Wang et al. [Paper](https://doi.org/10.3390/jmse12010182) |
| 2024 | *Integrated berth allocation and quay crane assignment and scheduling problem under the influence of various factors* — Yu et al. [Paper](https://ietresearch.onlinelibrary.wiley.com/doi/10.1049/cim2.70001) |
| 2025 | *Integrated proactive and reactive strategies for sustainable berth allocation and quay crane assignment under uncertainty* — Tan & He [Paper](https://doi.org/10.1007/s10479-020-03891-3) |
| 2025 | *A hierarchical reinforcement learning approach for real-time berth allocation and quay crane scheduling* — Jo & Moon [Paper](https://doi.org/10.1080/00207543.2025.2542518) |

##### 1.4 Constructive / Structured Representation

| Year | Reference |
|------|-----------|
| 1999 | *Ant colony optimization for the ship berthing problem* — Tong et al. [Paper](https://link.springer.com/chapter/10.1007/978-3-540-46632-6_28) |
| 2008 | *A multi-objective multi-colony ant algorithm for solving the berth allocation problem* — Cheong & Tan [Paper](https://link.springer.com/chapter/10.1007/978-3-540-87333-6_4) |
| 2010 | *A proactive approach for simultaneous berth and quay crane scheduling problem with stochastic arrival and handling time* — Han et al. [Paper](https://doi.org/10.1016/j.ejor.2010.04.001) |
| 2011 | *The Application Research of Container Berth Allocation Based on Ant Colony Algorithms* — Yu & Wang [Paper](https://ascelibrary.org/doi/10.1061/41184(419)250) |
| 2014 | *Ant colony system for solving quay crane scheduling problem in container terminal* — Azza et al. [Paper](https://ieeexplore.ieee.org/document/6971695) |
| 2022 | *An adaptive ant colony system based on variable range receding horizon control for berth allocation problem* — Wang et al. [Paper](https://doi.org/10.1109/TITS.2022.3167456) |
| 2023 | *Enhanced ant colony algorithm for discrete dynamic berth allocation* — Yu et al. [Paper](https://doi.org/10.3390/jmse11101931) |

---

#### II. With Robust Strategies

##### 2.1 Robustness-Guided Exploration

| Year | Reference |
|------|-----------|
| 2016 | *Robust berth allocation using a hybrid approach combining branch-and-cut and the genetic algorithm* — Alsoufi et al. [Paper](https://link.springer.com/chapter/10.1007/978-3-319-39636-1_11) |
| 2017 | *A bi-objective robust model for berth allocation scheduling under uncertainty* — Xiang et al. [Paper](https://doi.org/10.1016/j.tre.2017.07.006) |
| 2025 | *Hybrid genetic algorithm and Q-learning-based solution for the time-variant berth and quay crane allocation problem* — Liang et al. [Paper](https://doi.org/10.3389/fieng.2025.1523203) |
| 2025 | *Ternary Historical Memory-Based Robust Clustered Particle Swarm Optimization for Dynamic Berth Allocation and Crane Assignment Problem* — Wu et al. [Paper](https://doi.org/10.3390/math13152516) |

##### 2.2 Robustness-Guided Exploitation

| Year | Reference |
|------|-----------|
| 2012 | *Robust berth scheduling with uncertain vessel delay and handling time* — Xu et al. [Paper](https://doi.org/10.1007/s10479-011-1050-x) |
| 2014 | *A genetic algorithm for robust berth allocation and quay crane assignment* — Rodriguez-Molins et al. [Paper](https://doi.org/10.1007/s13748-014-0056-3) |
| 2014 | *Robust scheduling for berth allocation and quay crane assignment problem* — Rodriguez-Molins et al. [Paper](https://doi.org/10.1155/2014/834927) |
| 2015 | *Tactical berth allocation under uncertainty* — Zhen [Paper](https://doi.org/10.1016/j.ejor.2015.06.028) |
| 2016 | *A robust optimization approach to the integrated berth allocation and quay crane assignment problem* — Shang et al. [Paper](https://doi.org/10.1016/j.tre.2016.06.003) |
| 2016 | *A decision model for berth allocation under uncertainty considering service level using an adaptive differential evolution algorithm* — Liu et al. [Paper](https://doi.org/10.1142/S0217595916500494) |
| 2017 | *A bi-objective robust model for berth allocation scheduling under uncertainty* — Xiang et al. [Paper](https://doi.org/10.1016/j.tre.2017.07.006) |
| 2021 | *Particle swarm optimization algorithm with time buffer insertion for robust berth scheduling* — Park et al. [Paper](https://doi.org/10.1016/j.cie.2021.107585) |
| 2021 | *Berth allocation problem with uncertain vessel handling times considering weather conditions* — Guo et al. [Paper](https://doi.org/10.1016/j.cie.2021.107417) |
| 2022 | *An enhanced NSGA-II for solving berth allocation and quay crane assignment problem with stochastic arrival times* — Ji et al. [Paper](https://doi.org/10.1109/TITS.2022.3213834) |
| 2023 | *A bi-layer model for berth allocation problem based on proactive-reactive strategy* — Dai et al. [Paper](https://doi.org/10.1016/j.cie.2023.109200) |
| 2023 | *Two-stage robust programming modeling for continuous berth allocation with uncertain vessel arrival time* — Qu et al. [Paper](https://doi.org/10.3390/su151310560) |
| 2024 | *A proactive-reactive-based approach for continuous berth allocation and quay crane assignment problems with hybrid uncertainty* — Wang et al. [Paper](https://doi.org/10.3390/jmse12010182) |
| 2024 | *Robust Optimisation for an Integrated Model of Berth and Quay Crane Assignment at Maritime Container Terminals Respecting Uncertain Numbers of Quay Cranes* — Nourmohammadzadeh & Voß [Paper](https://doi.org/10.1007/978-3-031-71997-0_14) |
| 2025 | *Integrated proactive and reactive strategies for sustainable berth allocation and quay crane assignment under uncertainty* — Tan & He [Paper](https://doi.org/10.1007/s10479-020-03891-3) |
| 2025 | *Ternary Historical Memory-Based Robust Clustered Particle Swarm Optimization for Dynamic Berth Allocation and Crane Assignment Problem* — Wu et al. [Paper](https://doi.org/10.3390/math13152516) |

##### 2.3 Adaptive Search Regulation

| Year | Reference |
|------|-----------|
| 2016 | *A decision model for berth allocation under uncertainty considering service level using an adaptive differential evolution algorithm* — Liu et al. [Paper](https://doi.org/10.1142/S0217595916500494) |
| 2017 | *A bi-objective robust model for berth allocation scheduling under uncertainty* — Xiang et al. [Paper](https://doi.org/10.1016/j.tre.2017.07.006) |
| 2021 | *Particle swarm optimization algorithm with time buffer insertion for robust berth scheduling* — Park et al. [Paper](https://doi.org/10.1016/j.cie.2021.107585) |
| 2021 | *Berth allocation problem with uncertain vessel handling times considering weather conditions* — Guo et al. [Paper](https://doi.org/10.1016/j.cie.2021.107417) |
| 2022 | *An enhanced NSGA-II for solving berth allocation and quay crane assignment problem with stochastic arrival times* — Ji et al. [Paper](https://doi.org/10.1109/TITS.2022.3213834) |
| 2023 | *A bi-layer model for berth allocation problem based on proactive-reactive strategy* — Dai et al. [Paper](https://doi.org/10.1016/j.cie.2023.109200) |
| 2023 | *Integrated proactive-reactive approach and a hybrid adaptive large neighborhood search algorithm for berth and quay crane scheduling under uncertain combination* — Wu & Zhu [Paper](https://doi.org/10.3934/jimo.2022188) |
| 2023 | *Two-stage robust programming modeling for continuous berth allocation with uncertain vessel arrival time* — Qu et al. [Paper](https://doi.org/10.3390/su151310560) |
| 2024 | *A proactive-reactive-based approach for continuous berth allocation and quay crane assignment problems with hybrid uncertainty* — Wang et al. [Paper](https://doi.org/10.3390/jmse12010182) |
| 2025 | *Hybrid genetic algorithm and Q-learning-based solution for the time-variant berth and quay crane allocation problem* — Liang et al. [Paper](https://doi.org/10.3389/fieng.2025.1523203) |

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
