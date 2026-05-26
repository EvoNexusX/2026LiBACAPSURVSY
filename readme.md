# Robust BACAP Benchmark Framework

## Project Overview

This project targets the integrated Berth Allocation and Quay Crane Allocation Problem (BACAP) under uncertainty, and provides a standardized benchmark framework for studying the application of robust optimization and metaheuristic algorithms to port scheduling problems.

The framework:

- Supports datasets covering four vessel arrival patterns;
- Provides an integration framework that combines classical metaheuristics (GA / PSO / ACO) with robust strategies;
- Supports the simulation of multiple uncertainty scenarios;
- Provides unified performance and robustness evaluation metrics;
- Supports parallel experiments and batch execution.

---

# Overall Project Structure

```text
Root/
│
├── code/                    # Main directory for algorithm code
│
├── datasets/                # Dataset directory
│
└── README.md
```

---

# 1. The `code` Folder

The `code` folder contains the algorithm core, robust strategies, evaluation modules, uncertainty generators, and experiment scripts.

## 1.1 Algorithm and Robust Strategy Combinations

The code includes:

- Three metaheuristic algorithms:
  - GA (Genetic Algorithm)
  - PSO (Particle Swarm Optimization)
  - ACO (Ant Colony Optimization)

- Three robust strategies

These combine into:

```text
9 algorithm-strategy combinations
```

The corresponding directories are organized as follows:

```text
C1_1/
C2_1/
...
C9_1/
```

Where:

| ID | Meaning |
|---|---|
| C1_1, C4_1, C7_1 | Algorithm + Strategy 1 |
| C2_1, C5_1, C8_1 | Algorithm + Strategy 2 |
| C3_1, C6_1, C9_1 | Algorithm + Strategy 3 |

---

## 1.2 Main Function Description

Inside each algorithm folder, the file:

```text
C<number>_1.m
```

serves as the main function for the corresponding algorithm combination.

For example:

```text
C1_1.m
```

is:

- A specific metaheuristic algorithm
- Combined with its corresponding robust strategy as the main program entry point.

---

## 1.3 The `benchmark` Folder

```text
benchmark/
```

This directory is used for:

- Schedule evaluation;
- Robustness metric computation;
- General performance metric statistics.

Includes:

- Average port time;
- Survival time;

```text
generator/
```

This directory is used to simulate uncertainty scenarios.

It supports the following uncertainties:

| Uncertainty Type | Description |
|---|---|
| Vessel Arrival Time Uncertainty | Arrival Time Uncertainty |
| Vessel Handling Time Uncertainty | Handling Duration Uncertainty |
| Quay Crane Availability Uncertainty | Quay Crane Availability Uncertainty |
| Mixed Uncertainty Scenarios | Mixed Uncertainty |

This module is used to generate perturbation scenarios and robustness testing environments.
---

## 1.4 The `modules` Folder

```text
modules/
```

This directory contains:

- Common functions shared across algorithms;
- Decoding functions;
- Repair functions;
- Evaluation functions;
- Utility functions, etc.

It supports module reuse across different algorithms and robust strategies.

---

## 1.5 The `experiment` Folder

```text
experiment/
```

Where:

```text
test_3_flat.m
```

is the main script for parallel experiments.

Its functions include:

- Batch execution of the 9 algorithms;
- Multiple repeated trials;
- Parallel computation;
- Experiment statistics.

---

# 2. The `datasets` Folder

The dataset directory contains:

- Datasets for four vessel arrival patterns;
- Tidal time windows;
- Uncertainty data;
- Raw vessel and quay crane data.

---

## 2.1 Dataset Scale

Dataset files follow this naming convention:

| File Name | Vessel Scale |
|---|---|
| 1_1 | 50 vessels |
| 1_11 | 100 vessels |
| 1_111 | 200 vessels |

---

## 2.2 Uncertainty Annotation

### Vessel Arrival Time Uncertainty

Identified using:

```text
_a
```

as the suffix.

---

### Vessel Handling Time Uncertainty

Identified using:

```text
_h
```

as the suffix.

---

### Quay Crane Availability Uncertainty

Described using the file:

```text
berth_data.csv
```

---

## 2.3 Raw Datasets

The dataset folder contains the following raw files:

| File Name | Description |
|---|---|
| ships_50.xlsx | Raw data for 50 vessels |
| ships_100.xlsx | Raw data for 100 vessels |
| ships_200.xlsx | Raw data for 200 vessels |
| 2.xlsx | Raw quay crane availability data |

---

# 3. How to Modify the Experimental Dataset

To switch between different datasets for experiments, modify the data-loading section in:

```text
code/experiment/test_3_flat.m
```

Modifiable items include:

- Vessel scale;
- Uncertainty scenarios;
- Dataset paths;
- Experiment parameters;
- Number of repetitions, etc.

---

# 4. Supported Uncertainty Types

The framework supports the following four categories of uncertainty:

| Type | Description |
|---|---|
| UAT | Vessel Arrival Time Uncertainty |
| UHD | Vessel Handling Time Uncertainty |
| UQC | Quay Crane Availability Uncertainty |
| MU | Mixed Uncertainty Scenarios |

---

# 5. Performance Evaluation Metrics

The system uses:

## General Performance Metrics

- Average Port Time
- Makespan (completion time)
- Scheduling Efficiency

## Robustness Metrics

- Stability
- Survival Time
- Robustness Evaluation Index

These are used to comprehensively assess scheduling performance under uncertainty.

---

# 6. Recommended Workflow

The recommended execution steps are:

```text
1. Select the dataset scale
2. Configure the uncertainty scenario
3. Modify parameters in test_3_flat.m
4. Run the main function of the chosen algorithm
5. Call the benchmark module for evaluation
6. Aggregate experimental results
```

---

# 7. Notes

- It is recommended to run experiments with the MATLAB Parallel Computing Toolbox;
- Large-scale instances should be run with parallel computation;
- Ensure dataset consistency across different uncertainty scenarios;
- Evaluation metrics in the benchmark must match the experiment configuration.

