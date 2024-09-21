
# Online Pharmacy Checkout Feature Analysis

## TL;DR

The analysis suggests that enhancing visibility for adding non-medication items during checkout could lead to approximately a 10% increase in monthly revenue, with a target of 20% of customers adding these items to their carts.

---

## Background

As an analyst for an online pharmacy, you support a platform where customers order prescription medications and receive them via courier. Recently, a feature was introduced allowing customers to add non-medication items (like vitamins or Band-Aids) to their carts during checkout.

## Case Overview

In February 2024, the Product Team will increase the visibility of this feature, anticipating that 20% of customers will add non-medication items during checkout. Your role involves estimating the financial impact of this change and developing an experimentation plan.

### Objectives

1. Evaluate the potential impact of the proposed change.
2. Assess the success of the change if implemented.

## Assumptions

- **Data Range:** 11/01/2023 to 01/19/2024
- **Data Quality:** No duplicates, null rows, etc.
- **Business Model:** Visibility change on 02/01/2024.
- **Success Definition:** 20% or higher non-medication item addition rate during checkout.

## Metrics Analysis

### Checkout Metrics

- **Non-Medication Items Add-to-Cart Rate (Checkout attempts):**
  - **Formula:** `Number of orders where customer_added_non_med_to_order is True / Total checkout attempts`
  - **Overall Rate:** 3.26%

#### Monthly Breakdown

- **2023-11:** 0%
- **2023-12:** 4.6%
- **2024-01:** 6.43%
- **Non-Medication Items Add-to-Cart Rate (Completed orders):**

  - **Formula:** `Number of orders where customer_added_non_med_to_order = True / Total number of completed orders`
  - **Overall Rate:** 5.46%

#### Monthly Breakdown

- **2023-11:** 0%
- **2023-12:** 7.7%
- **2024-01:** 10.57%

### Checkout Rate

- **Formula:** `Total number of completed orders / Total checkout attempts`
- **Overall Rate:** 59.67%

#### Monthly Breakdown

- **2023-11:** 58.96%
- **2023-12:** 59.68%
- **2024-01:** 60.85%

### Delivery Metrics

- **Successful Delivery Rate:**
  - **Formula:** `Number of completed deliveries / Total number of completed orders`
  - **Overall Rate:** 93.14%

#### Monthly Breakdown

- **2023-11:** 93.36%
- **2023-12:** 94.12%
- **2024-01:** 91.12%

### Other General Metrics

- **Average Order Value:**
  - **Formula:** `Revenue / Number of delivered orders`
  - **Breakdown by Non-Medication Addition:**
    - **Added:** ≈ $30
    - **Not Added:** ≈ $20

#### Monthly Average Revenue

- **Formula:** `Sum of order_total_dollars (successfully delivered order)`
- **Breakdown by Month:**
  - **2023-11:** Revenue: $50,145, Number of Orders: 2,518
  - **2023-12:** Revenue: $55,172, Number of Orders: 2,639
  - **2024-01:** Revenue: $31,662, Number of Orders: 1,508

## Impact Evaluation

1. **Estimating Revenue Increase:**
   - Using December 2023 data:
     - **Total Orders:** 2,639
     - **Current Non-Medication Add-to-Cart Rate:** 7.7%
     - **Revenue:** $55,172
   - Assume no other metric changes:
     - **Estimated Orders with Non-Med:** 2,639 * 30% ≈ 791
     - **Estimated Orders without Non-Med:** 2,639 - 791 ≈ 1,848
     - **Estimated Revenue:** 791 * $30 + 1,848 * $20 ≈ $60,690
     - **% Increase:** ≈ 10%

## Success Evaluation

1. **Hypothesis Testing:**

   - **Null Hypothesis (H₀):** Add-to-cart rate for non-medication items (Checkout attempts) ≤ 20%
   - **Alternative Hypothesis (H₁):** Add-to-cart rate for non-medication items (Checkout attempts) > 20%
2. **Random Sampling:** Select a sample of users' add-to-cart rates to ensure unbiased data.
3. **Significance Level:** Set α = 0.05.
4. **Perform Hypothesis Test:** Conduct a one-tailed z-test or t-test.
5. **Interpret Results:** If p-value < α, reject H₀; otherwise, fail to reject H₀, determining if the rate significantly exceeds 20%.

---

This README outlines the analysis framework and evaluation plans to gauge the impact of the proposed checkout feature enhancement for non-medication items.
