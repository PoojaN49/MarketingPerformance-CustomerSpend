# Marketing Campaign Performance Analysis

## Project Overview

The aim of this project is to use data provided by Starbucks in order to understand how each marketing campagin performed on different consumer demographics and use that information to predict how a campagins may perform in the future and which consumer to target with the right offer . The bussiness case for this is that having better knowledge of which users will be more influenced by which campaigns will ultimatly help improve the Starbucks marketing strategy. It will also potentially allow to model ahead how well marketing will perform so that they can adjust these stratergies when needed.

## Data Sources
The following data sources have been provided by Starbucks to undertake this analysis:
The data is contained in three files:

portfolio.json - containing offer ids and meta data about each offer (duration, type, etc.)
profile.json - demographic data for each customer
transcript.json - records for transactions, offers received, offers viewed, and offers completed
Here is the schema and explanation of each variable in the files:

### portfolio.json

id (string) - offer id
offer_type (string) - type of offer ie BOGO, discount, informational
difficulty (int) - minimum required spend to complete an offer
reward (int) - reward given for completing an offer
duration (int) - time for offer to be open, in days
channels (list of strings)

### profile.json

age (int) - age of the customer
became_member_on (int) - date when customer created an app account
gender (str) - gender of the customer (note some entries contain 'O' for other rather than M or F)
id (str) - customer id
income (float) - customer's income

### transcript.json 

event (str) - record description (ie transaction, offer received, offer viewed, etc.)
person (str) - customer id
time (int) - time in hours since start of test. The data begins at time t=0
value - (dict of strings) - either an offer id or transaction amount depending on the record

## Objective
Our task is to combine transaction, demographic and offer data to determine which demographic groups respond best to which offer type through customer segmentation and predict the customer spend for given demographic and type of offer details.

## Modelling Stage

The first stage involved trying to understand the main demographic groups that use Starbucks on a regular basis(Exploaratory Data Analysis). This will help the understanding of which users are more easily influenced by the marketing campagins and therefore help the pediction modelling later on. It was decided to do this using the K-means unsupervised clustering method as it is a quick and easily applied unsupervised learning approach.

The second stage would is to build a model on the back of these demographics that can predict how user spend would change under the influence of the offers. This stage will involve using regression models using xgboost in order to try to predict daily user spend. This model was choosen as it high accuracy and low computation time but it has many Hyper Parameters to tune. In order to speed up the tuning of these parameters I decided to use xgboosts native API for testing as it's quicker and more flexible than the SKlearn equivalent. This model will be judged by looking at the Root Mean Squared Error (RMSE), this performance metric is useful when errors accross the whole dataset need to be kept to a minimum. This is useful as we will be aiming to predict every day spend even if there is a slight outlier or not.

## Results
To predict the marketing performance, I modelled the different demographics in order to group together users with similar behaviours using the K-means clustering. Finally, I created a regression model for each demographic using the XGBoost method to predict spend and quantify a baseline that could be use to determine marketing performance.
