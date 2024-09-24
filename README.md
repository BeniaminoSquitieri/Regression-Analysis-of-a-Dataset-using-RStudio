# Regression Analysis of a Dataset using RStudio

## Project Overview

This project involves the analysis of a dataset related to the technical specifications of a computer system. The analysis was conducted using **RStudio** and includes several statistical techniques such as correlation analysis, hypothesis testing, and regression analysis. The main objective was to assess how different independent variables (regressors) influence a dependent variable, specifically a **standardized index of software performance**.

## Team Members

- **Nicola Lanzara**
- **Fabrizio Sarno**
- **Beniamino Squitieri**
- **Antonio Vitale**

### Tools Used

- **RStudio**: A powerful IDE used for statistical computing and graphics. RStudio provides a rich environment to handle the dataset, conduct statistical analyses, and generate visual representations.

## Dataset

The dataset contains one dependent variable and six independent variables:
1. **y (Dependent Variable)**: Standardized and centered software performance index.
2. **x1 (Independent Variable)**: Standardized and centered CPU speed.
3. **x2**: Standardized and centered hard disk size.
4. **x3**: Standardized and centered number of software processes.
5. **x4**: Standardized and centered software aging.
6. **x5**: Standardized and centered sound card performance.
7. **x6**: Standardized and centered RAM performance.

## Data Analysis

### 1. **Preliminary Data Analysis**
   - The dataset was first visualized to understand the distribution and relationship between variables. All variables were found to be discrete and quantitative.

### 2. **Correlation Matrix**
   - A correlation matrix was created to assess the relationship between the independent and dependent variables. The scatterplot and correlation coefficients revealed:
     - **Positive correlation** between the dependent variable and **x1** (CPU speed) and **x3** (number of software processes).
     - **Negative correlation** with **x4** (software aging).
     - **Weak correlation** with other regressors.

   ![Correlation Matrix](correlation_matrix.png)

### 3. **Histograms**
   - Histograms were used to visualize the distribution of each variable, helping to detect any outliers or skewness in the data. This is crucial in determining how well the variables fit a normal distribution, which affects the regression analysis.

### 4. **Boxplot Analysis**
   - Boxplots were generated to show the distribution and outliers within each variable. It was observed that only the dependent variable exhibited outliers.

### 5. **Polynomial Regression**
   - Polynomial regression was conducted to explore the relationship between the dependent variable and individual regressors. The analysis found that:
     - **x1 (CPU speed)** and **x3 (number of software processes)** had a strong influence on the dependent variable.
     - Higher-order terms (e.g., **x1^2**, **x3^2**) were also examined, revealing that **x1^3** had a minor impact.

### 6. **Regression Model and Hypothesis Testing**
   - A linear regression model was built using the `lm` function in RStudio.
   - Statistical significance of the model was evaluated using p-values, and the fit of the model was checked using **Adjusted R²**. The model was refined iteratively to remove non-significant variables (**x2** and **x5**).
   - Tests performed include:
     - **t-test**: To verify that the residuals' mean is not significantly different from zero.
     - **Shapiro-Wilk test**: To check the normality of the residuals.
     - **Breusch-Pagan test**: To check for homoscedasticity.
     - **Durbin-Watson test**: To detect any autocorrelation in the residuals.

### 7. **Model Refinement**
   - The initial model was refined using **Stepwise regression** to optimize the variables included, resulting in a final model labeled **fit4**.
   - This model balances between minimizing the error and avoiding overfitting.

## Model Evaluation

- **Coefficient of Determination (R²)**: Calculated to measure how well the independent variables explain the variability in the dependent variable.
- **AIC and BIC**: Used for model selection. The model with the lowest **Akaike Information Criterion (AIC)** and **Bayesian Information Criterion (BIC)** values was chosen as optimal.

## Conclusion

The regression analysis identified that **CPU speed** and the **number of software processes** had the most significant impact on the software performance index. Other regressors like **hard disk size** and **sound card performance** were found to have little or no effect on the dependent variable. The project successfully built a refined regression model that accurately predicts the dependent variable while minimizing error and avoiding overfitting.

---

## References

- [R Documentation](https://www.rdocumentation.org/)
- [Stepwise Regression](https://en.wikipedia.org/wiki/Stepwise_regression)

