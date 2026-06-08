```python
import os
print (os.getcwd())
```

    C:\Users\91975\OneDrive\Documents
    


```python
import os
print (os.listdir())
```

    ['.ipynb_checkpoints', '.virtual_documents', 'anaconda_projects', 'coursera practice.sql', 'Custom Office Templates', 'DataCoSupplyChainDataset.csv.zip', 'desktop.ini', 'introduction.pbix', 'KingsoftData', 'My Tableau Repository', 'project 1.pbix', 'SQL Server Management Studio', 'SQL Server Management Studio 21', 'SQL Server Management Studio 22', 'supply_chain_analysis.ipynb']
    


```python
import os
print(os.getcwd())
print(os.listdir())
```

    C:\Users\91975\OneDrive\Documents
    ['.ipynb_checkpoints', '.virtual_documents', 'anaconda_projects', 'coursera practice.sql', 'Custom Office Templates', 'DataCoSupplyChainDataset.csv.zip', 'desktop.ini', 'introduction.pbix', 'KingsoftData', 'My Tableau Repository', 'project 1.pbix', 'SQL Server Management Studio', 'SQL Server Management Studio 21', 'SQL Server Management Studio 22', 'supply_chain_analysis.ipynb']
    


```python
import pandas as pd

df = pd.read_csv('DataCoSupplyChainDataset.csv', encoding='unicode escape')

print(df.shape)
print(df.head())
print(df.columns)

```

    (180519, 53)
           Type  Days for shipping (real)  Days for shipment (scheduled)  \
    0     DEBIT                         3                              4   
    1  TRANSFER                         5                              4   
    2      CASH                         4                              4   
    3     DEBIT                         3                              4   
    4   PAYMENT                         2                              4   
    
       Benefit per order  Sales per customer   Delivery Status  \
    0          91.250000          314.640015  Advance shipping   
    1        -249.089996          311.359985     Late delivery   
    2        -247.779999          309.720001  Shipping on time   
    3          22.860001          304.809998  Advance shipping   
    4         134.210007          298.250000  Advance shipping   
    
       Late_delivery_risk  Category Id   Category Name Customer City  ...  \
    0                   0           73  Sporting Goods        Caguas  ...   
    1                   1           73  Sporting Goods        Caguas  ...   
    2                   0           73  Sporting Goods      San Jose  ...   
    3                   0           73  Sporting Goods   Los Angeles  ...   
    4                   0           73  Sporting Goods        Caguas  ...   
    
      Order Zipcode Product Card Id Product Category Id  Product Description  \
    0           NaN            1360                  73                  NaN   
    1           NaN            1360                  73                  NaN   
    2           NaN            1360                  73                  NaN   
    3           NaN            1360                  73                  NaN   
    4           NaN            1360                  73                  NaN   
    
                                      Product Image  Product Name Product Price  \
    0  http://images.acmesports.sports/Smart+watch   Smart watch         327.75   
    1  http://images.acmesports.sports/Smart+watch   Smart watch         327.75   
    2  http://images.acmesports.sports/Smart+watch   Smart watch         327.75   
    3  http://images.acmesports.sports/Smart+watch   Smart watch         327.75   
    4  http://images.acmesports.sports/Smart+watch   Smart watch         327.75   
    
      Product Status shipping date (DateOrders)   Shipping Mode  
    0              0             2/3/2018 22:56  Standard Class  
    1              0            1/18/2018 12:27  Standard Class  
    2              0            1/17/2018 12:06  Standard Class  
    3              0            1/16/2018 11:45  Standard Class  
    4              0            1/15/2018 11:24  Standard Class  
    
    [5 rows x 53 columns]
    Index(['Type', 'Days for shipping (real)', 'Days for shipment (scheduled)',
           'Benefit per order', 'Sales per customer', 'Delivery Status',
           'Late_delivery_risk', 'Category Id', 'Category Name', 'Customer City',
           'Customer Country', 'Customer Email', 'Customer Fname', 'Customer Id',
           'Customer Lname', 'Customer Password', 'Customer Segment',
           'Customer State', 'Customer Street', 'Customer Zipcode',
           'Department Id', 'Department Name', 'Latitude', 'Longitude', 'Market',
           'Order City', 'Order Country', 'Order Customer Id',
           'order date (DateOrders)', 'Order Id', 'Order Item Cardprod Id',
           'Order Item Discount', 'Order Item Discount Rate', 'Order Item Id',
           'Order Item Product Price', 'Order Item Profit Ratio',
           'Order Item Quantity', 'Sales', 'Order Item Total',
           'Order Profit Per Order', 'Order Region', 'Order State', 'Order Status',
           'Order Zipcode', 'Product Card Id', 'Product Category Id',
           'Product Description', 'Product Image', 'Product Name', 'Product Price',
           'Product Status', 'shipping date (DateOrders)', 'Shipping Mode'],
          dtype='object')
    


```python
#print (df.isnull().sum())
```


```python
df = df.drop(['Customer Email', 'Customer Password', 'Product Image'], axis=1, errors = 'ignore')
```


```python
df ['Is Late'] = (df ['Delivery Status'] == 'Late Delivery').astype (int)
print (df['Is Late'].value_counts())
```

    Is Late
    0    180519
    Name: count, dtype: int64
    


```python
features = [
    'Days for shipping (real)',
    'Shipping Mode',
    'Order Region',
    'Category Name',
    'Sales'
]

df_model = df[features + ['Is Late']].dropna()

df_model = pd.get_dummies(
    df_model,
    columns=[
        'Shipping Mode',
        'Order Region',
        'Category Name'
    ]
)

print(df_model.shape)
```

    (180519, 80)
    


```python
from sklearn.model_selection import train_test_split

X = df_model.drop('Is Late', axis=1)
y = df_model['Is Late']

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42)

# This means: 80% data to train the model, 20% to test it
```


```python
print(df['Delivery Status'].value_counts())
```

    Delivery Status
    Late delivery        98977
    Advance shipping     41592
    Shipping on time     32196
    Shipping canceled     7754
    Name: count, dtype: int64
    


```python

df['Is_Late'] = (df['Delivery Status'] == 'Late delivery').astype(int)

print(df['Is_Late'].value_counts())
```

    Is_Late
    1    98977
    0    81542
    Name: count, dtype: int64
    


```python
features = [
    'Days for shipping (real)',
    'Shipping Mode',
    'Order Region',
    'Category Name',
    'Sales'
]

df_model = df[features + ['Is_Late']].dropna()

df_model = pd.get_dummies(
    df_model,
    columns=[
        'Shipping Mode',
        'Order Region',
        'Category Name'
    ]
)

print(df_model.shape)
```

    (180519, 80)
    


```python
from sklearn.model_selection import train_test_split

X = df_model.drop('Is_Late', axis=1)
y = df_model['Is_Late']

print(y.value_counts())

X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=0.2,
    random_state=42
)
```

    Is_Late
    1    98977
    0    81542
    Name: count, dtype: int64
    


```python
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, classification_report

model = LogisticRegression(max_iter=1000)

model.fit(X_train, y_train)

predictions = model.predict(X_test)

accuracy = accuracy_score(y_test, predictions)

print(f"Model Accuracy: {accuracy*100:.2f}%")
print(classification_report(y_test, predictions))
```

    Model Accuracy: 97.49%
                  precision    recall  f1-score   support
    
               0       1.00      0.94      0.97     16307
               1       0.96      1.00      0.98     19797
    
        accuracy                           0.97     36104
       macro avg       0.98      0.97      0.97     36104
    weighted avg       0.98      0.97      0.97     36104
    
    


```python
import matplotlib.pyplot as plt
import numpy as np

coefficients = pd.Series(model.coef_[0], index=X.columns)
top_features = coefficients.abs().nlargest(10)

top_features.plot(kind='barh', color='steelblue')
plt.title('Top 10 Factors Causing Delays')
plt.xlabel('Impact Score')
plt.tight_layout()
plt.savefig('delay_factors.png')
plt.show()


```<img width="629" height="470" alt="output_14_0" src="https://github.com/user-attachments/assets/fc83280c-e6f7-4d84-80bd-6f324b61e44c" />



```python

```


```python

```
