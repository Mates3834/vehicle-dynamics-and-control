# Vehicle Dynamics and Control

A MATLAB/Simulink-based study of **vehicle dynamics, tire modeling, braking control, yaw stability control, disturbance rejection, and vehicle state estimation**.

The project combines several vehicle dynamics and control problems within a unified portfolio, ranging from nonlinear tire-force modeling and single-track vehicle dynamics to ABS and advanced yaw stability control.

---

## Overview

The project covers four main areas:

1. **Tire Modeling**
2. **Vehicle Dynamics Modeling**
3. **Anti-lock Braking System (ABS) Control**
4. **Yaw Stability Control and State Estimation**

The objective is to investigate how vehicle dynamics change under different operating and road conditions and to develop control and estimation approaches for improving vehicle stability and performance.

---

# 1. Tire Modeling

Several tire models are investigated in MATLAB/Simulink.

### Implemented Models

- Linear Tire Model
- Magic Tire Formula
- Simple Dugoff Model
- Complicated Dugoff Model

The models are used to investigate the relationship between tire-road interaction variables and generated forces.

### Longitudinal Tire Force

Longitudinal force behavior is analyzed with respect to **slip ratio**.

### Lateral Tire Force

Lateral tire force is investigated as a function of **slip angle**.

### Self-Aligning Moment

The relationship between slip angle and self-aligning moment is also examined.

These models provide the foundation for the subsequent vehicle dynamics and control studies.

---

# 2. Vehicle Dynamics

Both **linear and nonlinear single-track vehicle models** are investigated.

## Nonlinear Single-Track Model

The nonlinear model represents the coupled longitudinal and lateral behavior of the vehicle.

The simulation framework considers:

- Longitudinal velocity
- Lateral velocity
- Yaw rate
- Side-slip behavior
- Steering input
- Tire forces
- Road friction
- External disturbances

## Linearized Single-Track Model

A linearized model is also developed to investigate vehicle behavior around selected operating conditions.

The linear and nonlinear models are compared under different:

- Vehicle velocities
- Tire-road friction coefficients
- Steering inputs
- Disturbance conditions

---

# 3. Cruise Control

A simple cruise-control architecture is integrated with the nonlinear vehicle model to maintain approximately constant longitudinal velocity.

This enables lateral vehicle behavior to be studied while maintaining the desired operating speed.

---

# 4. Disturbance Analysis

External disturbances are introduced into the vehicle model to evaluate dynamic behavior and stability.

The investigated inputs include:

- Step steering input
- Wind disturbance
- Pulse disturbance
- Step disturbance

The resulting vehicle responses are evaluated using:

- Yaw rate
- Side-slip angle
- Vehicle trajectory

---

# 5. Anti-lock Braking System

A quarter-car braking model is used to investigate **Anti-lock Braking System (ABS)** control.

Three braking approaches are evaluated:

- Uncontrolled braking
- Bang-Bang ABS
- PD-based ABS control

The controllers are compared in terms of vehicle and wheel behavior during braking.

## Performance Evaluation

The analysis considers:

- Vehicle velocity
- Wheel velocity
- Slip behavior
- Brake torque
- Stopping performance

The effect of changing tire-road friction characteristics is also investigated to represent different road conditions.

---

# 6. Yaw Stability Control

Vehicle yaw stability is investigated using several control architectures.

## Conventional Yaw Stability Control

A conventional feedback-based yaw stability controller is investigated as a baseline approach.

The controller aims to reduce the difference between the desired and actual vehicle yaw behavior.

---

## Direct Yaw Moment Control

A **Direct Yaw Moment Control (DYC)** architecture is used to improve lateral vehicle stability.

The controller generates a corrective yaw moment according to the vehicle's dynamic response.

The objective is to improve:

- Yaw-rate tracking
- Lateral stability
- Disturbance rejection

---

# 7. Disturbance Observer Based Control

A **Disturbance Observer (DOB)** based yaw stability architecture is investigated to estimate and compensate for disturbances affecting vehicle dynamics.

Conceptually:

Vehicle Dynamics → Disturbance Estimation → Compensation → Improved Yaw Stability

The observer-based structure enables the controller to respond to disturbances that are not explicitly represented in the nominal vehicle model.

---

# 8. Vehicle Side-Slip Observer

Vehicle side-slip behavior is important for lateral stability but may not always be directly available for feedback.

A **vehicle side-slip observer** is therefore investigated to estimate the required vehicle state from available dynamic information.

The estimated state can subsequently be used within the vehicle stability control architecture.

---

# Simulation Studies

The complete set of studies evaluates vehicle behavior under different:

- Vehicle velocities
- Tire-road friction coefficients
- Steering inputs
- Braking conditions
- Disturbances
- Road conditions

Linear and nonlinear vehicle responses are compared where applicable.

---

# Technologies

- MATLAB
- Simulink
- Vehicle Dynamics Modeling
- Tire Modeling
- ABS Control
- Yaw Stability Control
- Direct Yaw Moment Control
- Disturbance Observer
- State Estimation

---

# Research Areas

- Vehicle Dynamics and Control
- Autonomous Vehicles
- Advanced Driver Assistance Systems
- Vehicle Stability Control
- Nonlinear Dynamics
- State Estimation
- Disturbance Rejection
- Automotive Control Systems

---

# Repository Structure

```text
vehicle-dynamics-and-control/
│
├── README.md
│
├── tire-models/
│   ├── linear/
│   ├── magic-formula/
│   └── dugoff/
│
├── vehicle-dynamics/
│   ├── linear-single-track/
│   └── nonlinear-single-track/
│
├── abs-control/
│
├── yaw-stability/
│   ├── conventional/
│   ├── direct-yaw-moment/
│   └── disturbance-observer/
│
├── state-estimation/
│   └── sideslip-observer/
│
├── simulink/
│
├── results/
│
└── docs/
