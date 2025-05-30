[Dashboard Link (Fast PDF)](https://drive.google.com/file/d/1FvI6KjAHQ-Xk1ekj17PQGhHmtaW1OQPa/view?usp=sharing) 

**Practices are learned and combined from multiple sources to complete a complete project for Data Analyst. Another level can be called Business Intelligence**

# General Overview
This analytics project aims to boost AdventureWorks Cycles' revenue by analyzing company data. The process includes accessing the data warehouse, data cleaning, and transformation, followed by a detailed examination to extract valuable insights for strategic decision-making.

**Goal**: 
* **Interactive:** Discover trends and make informed decisions in their respective roles.
* **Dynamic, Real-time Update:**  Our charts and dashboards dynamically update in real-time as data

## About AdventureWorks Cycles
AdventureWorks Cycles, headquartered in Bothell, Washington, is a major multinational manufacturer of metal and composite bicycles. With a strong presence in North America, Europe, and Asia, the company employs 500 individuals and strategically deploys regional sales teams to serve its diverse market base.

![image](https://github.com/user-attachments/assets/543d9a45-8d79-49e4-9416-6f5593804731)


## Tools
**Tools used:** 
* SQL Server
* Python notebook
* Azure Data Studio
* PowerBI
## Appendix
![image](https://github.com/user-attachments/assets/345c2cc4-cf1e-45e8-b0a4-d91f1ab07ab7)

* **a. Data Cleaning and Transformation:** (SQL Server)
  * Assumptions
  * Transformation
  * New Star Schema

   
* **b. Descriptive Analysis:** (Python, Azure, and SQL)
  * Step 1: Key Metrics Analysis
  * Step 2: Time Series Analysis
  * Step 3: Product Analysis
  * Step 4: Customer Analysis
 
* **c. Diagnostics Analysis:** (Dashboard with PowerBI)
  * Step 5: Time Series Dashboard
  * Step 6: Geographical Dashboard
  * Step 7: Demographic Dashboard
  * Step 8: Product Selection Dashboard
  
* **d. Predictive Analysis:** (Machine Learning/Deep Learning using Python)
  * Step 9: Trendline
  * Step 10: ARIMA Model
  * Step 11: LSTM Model
  
* **e. Prescriptive Analysis:** (Recommendation for the next year)
  * Step 12: To-be Business model with Actionable Insight

# Analysis
## a. Data Cleaning and Transformation:
  * **Transformation:** Given that we don't require all the columns from the table, it is advisable to cherry-pick only the essential ones. Additionally, we plan to:
    * Data cleaning by standardized datetime values for improved consistency.
    * Eliminate unnecessary columns
    * Apply more reader-friendly names.
    * Introduce new calculated columns, including Profit, Profit Margin, ShipStatus, TimeToArrive, TimeToShip, Model Name, and Customer Age for enhanced analytical insights.
     
  * **New Star Schema:**
    ![image](https://github.com/user-attachments/assets/61de917f-da00-4823-bbe2-b6f1be36309f)

## b. Descriptive Analysis
### 1. Key Metrics
 - Total Revenue: $29M
 - Total Profit: $9M
 - Total Tax Amount: $2.4M
 - Total Freight Cost: $734K
 - Profit Margin: 42.84%

### 2. Time Series Analysis (Only 2011, 2012, 2013, Exclude Dec 2010 and Jan 2014)
* **Yearly**

![image](https://github.com/user-attachments/assets/a2921789-6a04-418a-b232-b49a50b3c475)



    - 2011: 7 Millions
    - 2012: 6 Millions
    - 2013: 14 Millions
    - 2014 and 2010: 2 Millions (December 2010 and January 2011
  
* **Monthly**

![image](https://github.com/user-attachments/assets/720d9ad6-33da-448c-9ad5-66e7008fe605)



    - Best: June, October, November, December
    - Worst: January, February, April

### 3. Product Analysis
![image](https://github.com/user-attachments/assets/7354ebc7-257e-4cc7-aa97-75e1c57c4bd6)



*  **Overview**
   - **Bikes:** 95% Profits
   - **Clothing:** 4% Profits
   - **Accessories:** 1% Profits
* **Best and worst Selling**
  - **Best Selling:** Mountain Model 200 (high revenue, high profit)
  - **Worst selling** Road 650, Road 750, Clothing Caps (low Revenue, low profit Margin)


### 4. Customer Analysis
![image](https://github.com/user-attachments/assets/6e15a748-f0be-4fc5-96ec-06c6ea966823)


* **Education:** Bachelors, Graduate and Partial College
* **Occupation:** Professional, Management, and Skill Manual
* **Sex:** Both M and F
* **Income:** $70000
* **Age:** From 40 to 60

## c. Diagnostics Analysis
### 5. Time Series Dashboard (Why was 2013 Revenue so high?)
- Mountain Bikes Sales increase (Especially model 200)
- Accessories and Clothing were introduced
- Touring Bikes was introduced (Generating 3.7 million dollars).

### 6. Geographical Dashboard
![image](https://github.com/user-attachments/assets/6bc6bafb-caed-4b28-9cef-19026e9e502a)


Here are the best current markets for the Model 200
- Top Country: USA, Australia, United Kingdom
- Top States: California, England (General), New Southwale, Washington, British Columbia, Queensland (All coast state)
- Top City: London, Paris, Bendigo, Wollongong, Berlin

### 7. Customer Dashboard
![image](https://github.com/user-attachments/assets/b172cebb-86ef-4c15-b102-21d989fef507)


Here are the current demographic needs for the Model 200
- Education: Bachelors, Graduate and Partial College
- Occupation: Professional, Management, and Skill Manual
- Sex: Both M and F
- Income: $70000
- Age: From 40 to 60

### 8. Product Selection Dashboard
  - Best Selling: Mountain Model 200 (high revenue, high profit)
  - Worst selling: Road 650, Road 750, Clothing Caps (low Revenue, low-profit Margin)


## d. Predictive Analysis:
**Decomposition & Trend Identification**  
Before diving into predictive modeling, a time series decomposition was performed to observe underlying patterns, including trends, seasonality, and residuals. This helped confirm strong seasonal patterns but revealed some irregularities that simple models might struggle with. Since we don't see any clear seasonality, we can remove this factor

### 9. Trendline
![image](https://github.com/user-attachments/assets/8dd2706f-80ee-4ee7-8c08-4e06086657e2)


### 10. ARIMA Model
Instead of manually analyzing ACF and PACF plots to determine the optimal parameters for ARIMA, AutoARIMA was chosen for its ability to automate this process. This approach reduced complexity while still ensuring a model tuned to the data’s characteristics. The trade-off here is a slight loss of manual control over parameter selection for the sake of efficiency and speed.

![image](https://github.com/user-attachments/assets/1965ff54-4c33-4837-bc7e-978c00a08859)


### 11. LSTM model
Given the limitations of ARIMA in capturing non-linear patterns, LSTM (Long Short-Term Memory) networks were introduced. LSTM models excel in handling long-term dependencies and non-linear relationships, making them ideal for complex time series data with irregular fluctuations.

![image](https://github.com/user-attachments/assets/3898fd53-ce8a-4d53-921c-beeadaecf572)


**Model Selection Trade-offs**  
- **ARIMA**: Works well with linear trends and seasonality. Quick to train but struggles with non-linear patterns.  
- **LSTM**: Captures non-linear dynamics but requires more data and computational resources, with longer training times.


**MAPE Comparison**  
To evaluate performance, the Mean Absolute Percentage Error (MAPE) was calculated for each model:  
- **ARIMA**: MAPE ~ 8%  
- **LSTM**: MAPE ~ 5%  

Although LSTM outperforms ARIMA in predictive accuracy, its complexity and computational overhead must be justified by the business context and the importance of precise predictions. 

**Conclusion**  
Both models have distinct strengths. For short-term, linear forecasting, ARIMA is sufficient. However, for capturing long-term trends with non-linear patterns, LSTM is the preferred model.

## e. Prescriptive Analysis:
### 12. Business Proposal (To-be​) Actionable Insight: Increase Model-200 Sales
1. **Cut product**
   * Cut Road 650, Road 750, Clothing Caps
    
3. **Using that budget to create a marketing campaign to tap into a new market for Model 200**
   * **Location:** Appalachian Mountains
   * **Criteria:**
   ![image](https://github.com/MarkPhamm/Adventureworks-Analytics/assets/99457952/eb253e0f-59e6-4612-b662-d1c0ba24612d)
   * **Suggestions**
     - Virginia (Roanoke)
     - West Virginia (Morgantown)
     - North Carolina (Asheville)
   * **Demographic:**
     - Education: Bachelors, Graduate and Partial College
     - Occupation: Professional, Management, and Skill Manual
     - Sex: Both M and F
     - Income: $70000
     - Age: From 40 to 60
   * **Time seasonality:**
     - June
     - October
     - November
     - December
    
4. **Create bundles with the Marketing campaign**
   * Create bundles when selling Mountain Bikes with Clothing/Accessories to increase purchasing initiative 
     
5. **Marketing channel:**
   * Local Bike Festivals - heart of Virginia bike festival, youth  cross-country bicycle rodeo
   * Partnership with local communities
   * Sponsorships, influencers, competitive bikers
     
6. **Forecast potential result**
   * Model-200 Revenue will increase by 50%
   * Clothing and Accessories will increase by 30%
