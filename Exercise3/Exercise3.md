Exercise 3
================
By Eliza Malinova, Zhenghao Li, and Raushan Baizakova

# Problem 1. Predictive Model Building

To build the most accurate predictive model possible, we compared
multiple statistical methods: a hand-built linear model, a linear model
using forward selection, Lasso model, and two tree-based models using
bagging and random forest, respectively. We first compared the two
linear models with Lasso by using train/test splits with a loop of 100
to calculate the RMSE, and we concluded that Lasso did not result in an
improved prediction accuracy. Therefore, we included the tree-based
models to try and improve our predictions. In order to decide which
model performs best, out of the 5 previously described models, we
employed Leave-one-out cross validation (LOOCV) RMSE, and chose the one
that decreased the RMSE the most.

Before starting fitting regression models, we needed to omit all missing
variables in the dataset. Total observations got reduced from 7,894 to
7,820. In addition, we included green\_ratings instead of LEED and
EnergyStar in all of the models, and used cd\_total\_07 and hd\_total07
separately instead of total\_dd\_07. Since cluster rent is most likely a
function of Rent, we omitted it to avoid regressing the target variable
on a variable that is a part of the target variable itself.

### First Model: Hand-Built Linear Model

We built a multiple linear regression model with variables that, based
on our knowledge and intuition, can affect rent. The model and the
selected variables are shown below:

Rent<sub>β</sub> = β<sub>1</sub> cluster + β<sub>2</sub> size +
β<sub>3</sub> empl\_gr + β<sub>4</sub> leasing\_rate + β<sub>5</sub>
stories + β<sub>6</sub> stories\* size + β<sub>7</sub> cd\_total\_07\*
Electricity\_Costs + β<sub>8</sub> age + β<sub>9</sub> renovated +
β<sub>10</sub> class\_a + β<sub>11</sub> class\_b + β<sub>12</sub>
green\_rating + β<sub>13</sub> net + β<sub>14</sub> amenities +
β<sub>15</sub> cd\_total\_07 + β<sub>16</sub> hd\_total07 + β<sub>17
</sub> Precipitation + β<sub>18</sub> Gas\_Costs + β<sub>19</sub>
Electricity\_Costs + β<sub>20</sub> Electricity\_Costs\*hd\_total07

### Second Model: Model Based on Forward Selection

For the second model, we used forward selection in order to select
variables that improve the prediction accuracy.

The table below lists the variables and estimates for the hand-built
multiple linear regression model and for the forward selected regression
model, respectively.

<table style="border-collapse:collapse; border:none;">

<caption style="font-weight: bold; text-align:left;">

**Table 1.0: Coefficients of the Hand-Built and Forward Selection Linear
Models**

</caption>

<tr>

<th style="border-top: double; text-align:center; font-style:italic; font-weight:normal; padding:0.2cm; border-bottom:1px solid black; text-align:left; ">

 

</th>

<th colspan="2" style="border-top: double; text-align:center; font-style:italic; font-weight:normal; padding:0.2cm; border-bottom:1px solid black;">

Hand-Built Linear Model

</th>

<th colspan="2" style="border-top: double; text-align:center; font-style:italic; font-weight:normal; padding:0.2cm; border-bottom:1px solid black;">

Forward Selection Linear Model

</th>

</tr>

<tr>

<td style=" color: red; border-bottom:1px solid black; text-align:left; ">

Predictors

</td>

<td style=" color: red; border-bottom:1px solid black; ">

Estimates

</td>

<td style=" color: red; border-bottom:1px solid black; ">

p

</td>

<td style=" color: red; border-bottom:1px solid black; ">

Estimates

</td>

<td style=" color: red; border-bottom:1px solid black; ">

p

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

(Intercept)

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

29.11

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

167.48

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

cluster

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.347

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

size

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.100

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

empl\_gr

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.26

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

leasing\_rate

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.06

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.10

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.015</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

stories

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.08

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

cd\_total\_07

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.01

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.08

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Electricity\_Costs

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-443.21

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1067.12

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.03

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.07

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.179

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

renovated

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-1.22

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-9.20

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.001</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

class\_a

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

4.66

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

26.83

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

class\_b

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.65

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

26.43

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

green\_rating

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.63

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.201

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

net

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-4.82

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-2.22

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.297

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

amenities

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.73

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.021</strong>

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-9.80

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

hd\_total07

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.01

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.03

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Precipitation

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.14

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.04

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Gas\_Costs

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

219.04

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.126

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-11020.42

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

size \* stories

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.935

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

cd\_total\_07 \*<br>Electricity\_Costs

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.10

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Electricity\_Costs \*<br>hd\_total07

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.37

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.30

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Electricity\_Costs \*<br>cd\_total\_07

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.53

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Electricity\_Costs \*<br>Precipitation

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

31.20

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

cd\_total\_07 \*<br>Precipitation

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Electricity\_Costs \*<br>class\_a

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-351.02

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Electricity\_Costs \* size

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Electricity\_Costs \* age

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

5.62

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

cd\_total\_07 \* size

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.349

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Precipitation \* size

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.001</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age \* hd\_total07

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

size \* hd\_total07

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Electricity\_Costs \*<br>Gas\_Costs

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-315675.21

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

cd\_total\_07 \* Gas\_Costs

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

6.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

cluster \* size

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

cd\_total\_07 \* hd\_total07

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

hd\_total07 \* Gas\_Costs

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

2.55

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Precipitation \*<br>hd\_total07

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

size \* Gas\_Costs

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Electricity\_Costs \*<br>cluster

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.10

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.040</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age \* Gas\_Costs

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-13.08

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

class\_a \* Precipitation

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.21

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

leasing\_rate \* size

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.032</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Gas\_Costs \* amenities

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1094.50

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

class\_a \* amenities

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-1.84

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.006</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age \* size

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

class\_a \* size

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

cd\_total\_07 \* cluster

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.005</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

class\_a \* leasing\_rate

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.05

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.014</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

size \* amenities

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.011</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age \* class\_b

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.05

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

size \* class\_b

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Electricity\_Costs \*<br>class\_b

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-437.86

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Precipitation \* class\_b

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.14

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.001</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

class\_a \* age

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.03

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.145

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

cluster \* class\_b

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.058

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

cd\_total\_07 \* net

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.019</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Electricity\_Costs \*<br>leasing\_rate

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

2.22

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.007</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

hd\_total07 \* class\_b

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

class\_a \* hd\_total07

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.001</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Precipitation \*<br>leasing\_rate

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.015</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

leasing\_rate \* class\_b

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.03

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.075

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

hd\_total07 \* renovated

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age \* renovated

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.02

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.030</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Electricity\_Costs \*<br>renovated

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

216.50

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.001</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

cd\_total\_07 \* renovated

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.003</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Precipitation \* amenities

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.06

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.076

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Precipitation \* cluster

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.033</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

cluster \* Gas\_Costs

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.36

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.134

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

net \* Gas\_Costs

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-349.57

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.084

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Gas\_Costs \* renovated

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-564.35

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.010</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

Precipitation \* renovated

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.08

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.022</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; color: blue; border-top:1px solid;">

Observations

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; color: blue; text-align:center; border-top:1px solid;" colspan="2">

7820

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; color: blue; text-align:center; border-top:1px solid;" colspan="2">

7820

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; color: blue;">

R<sup>2</sup> / R<sup>2</sup> adjusted

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; color: blue; text-align:center;" colspan="2">

0.399 / 0.398

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; color: blue; text-align:center;" colspan="2">

0.478 / 0.474

</td>

</tr>

</table>

### Third Model: Lasso Model

By using a shrinkage method like Lasso, we depart from optimality and
concentrate on stabilizing the system. Since the two linear models above
include many variables, there is the possibility of high variance
because each nonzero independent variable included in the model incurs a
cost of employing data to estimate it, hence, increasing the variance.
Through Lasso model, we make the cost we incur from having many
variables explicit. Therefore, through coefficient shrinkage, we can
reduce their variance.

The variable regression and the accuracy of the Lasso model fit largely
depend on the choice of lambda. The coefficient plot below shows that
depending on the value of the tuning parameter, some of the coefficients
will be set equal to 0.

![](Exercise3_files/figure-gfm/setup%201.3-1.png)<!-- -->

By employing Lasso model, we consider the variance-bias trade off, and
examine lambda. If lambda is high, the variance decreases but bias
increases.

We used cross-validation as a method to select the tuning parameter,
lambda. We chose a grid of lambda values that vary from 10^(-2) to 10^10
and computed the leave-one-out cross validation error for each of these
values. The tuning parameter of 0.008 has the smallest cross validation
error, so we chose it for the refit of the Lasso model. The graph below
illustrates the lambda with the least CV Mean Squared Error(MSE).
However, the dip of the CV MSE, where the lambda gives a small error, is
not very pronounced, resulting in a wide range of values for lambda that
will give similar errors.

![](Exercise3_files/figure-gfm/setup%201.4-1.png)<!-- -->

Since lambda is very close to 0, approximately 0.008, Lasso’s results
will be very close to the least squares models with high variance and
low bias. The table below shows the Lasso coefficient estimates. Using
lambda = 0.008, all the 17 coefficient estimates are nonzero.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

**Table 1.1 Lasso Model Predictor Estimates**

</caption>

<thead>

<tr>

<th style="text-align:left;">

Predictor

</th>

<th style="text-align:right;">

Estimate

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

(Intercept)

</td>

<td style="text-align:right;">

28.4209220

</td>

</tr>

<tr>

<td style="text-align:left;">

cluster

</td>

<td style="text-align:right;">

1.0790629

</td>

</tr>

<tr>

<td style="text-align:left;">

size

</td>

<td style="text-align:right;">

1.6126260

</td>

</tr>

<tr>

<td style="text-align:left;">

empl\_gr

</td>

<td style="text-align:right;">

3.5145064

</td>

</tr>

<tr>

<td style="text-align:left;">

leasing\_rate

</td>

<td style="text-align:right;">

1.3993137

</td>

</tr>

<tr>

<td style="text-align:left;">

stories

</td>

<td style="text-align:right;">

\-0.8507419

</td>

</tr>

<tr>

<td style="text-align:left;">

age

</td>

<td style="text-align:right;">

\-0.4085134

</td>

</tr>

<tr>

<td style="text-align:left;">

renovated

</td>

<td style="text-align:right;">

\-0.9499765

</td>

</tr>

<tr>

<td style="text-align:left;">

class\_a

</td>

<td style="text-align:right;">

2.6833697

</td>

</tr>

<tr>

<td style="text-align:left;">

class\_b

</td>

<td style="text-align:right;">

1.0581586

</td>

</tr>

<tr>

<td style="text-align:left;">

green\_rating

</td>

<td style="text-align:right;">

\-0.2469625

</td>

</tr>

<tr>

<td style="text-align:left;">

net

</td>

<td style="text-align:right;">

\-1.0126713

</td>

</tr>

<tr>

<td style="text-align:left;">

amenities

</td>

<td style="text-align:right;">

0.3392292

</td>

</tr>

<tr>

<td style="text-align:left;">

cd\_total\_07

</td>

<td style="text-align:right;">

\-2.1842729

</td>

</tr>

<tr>

<td style="text-align:left;">

hd\_total07

</td>

<td style="text-align:right;">

1.8199030

</td>

</tr>

<tr>

<td style="text-align:left;">

Precipitation

</td>

<td style="text-align:right;">

6.4168899

</td>

</tr>

<tr>

<td style="text-align:left;">

Gas\_Costs

</td>

<td style="text-align:right;">

\-4.5819721

</td>

</tr>

<tr>

<td style="text-align:left;">

Electricity\_Costs

</td>

<td style="text-align:right;">

9.4421085

</td>

</tr>

</tbody>

</table>

Next, we use train/test splits with a loop of 100 to calculate the
average RMSE of each of the three models shown above. Table 1.2
illustrates the average RMSE for each of the models.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

**Table 1.2 Average RMSE per Model**

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:right;">

Average RMSE

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Hand-Built Linear Model

</td>

<td style="text-align:right;">

11.76744

</td>

</tr>

<tr>

<td style="text-align:left;">

Forward Selection Linear Model

</td>

<td style="text-align:right;">

11.11559

</td>

</tr>

<tr>

<td style="text-align:left;">

Lasso

</td>

<td style="text-align:right;">

12.14934

</td>

</tr>

</tbody>

</table>

In this situation, the lasso regression does not give more accurate
predictions than the OLS based models as seen from the RMSE. In
addition, the optimal lambda is 0.008, almost 0, therefore, the
coefficient estimates are very similar to the least squared regression
models. Using both Lasso and OLS results in high variance and low bias.

### Tree-Based Models

Since Lasso model results in higher RMSE than the linear regression
models, we decided to perform two tree decision models using bagging and
random forest.

**Bagging**

The reason why we are employing the bagging procedure is because fitting
individual decision trees results in high variance. For example, if we
decide to use different parts of the data, the decision tree of one part
of data split will give outcomes that are very different from the
decision tree of another part of the data. Since bagging uses the
bootstrap procedure to take repeated samples from the training set and
average the resulting prediction, it reduces the variance of the
statistical model and therefore increases the prediction accuracy.

The bagging procedure has created 500 trees by bootstrapping, and all
the 17 variables are considered at each split since the trees are not
pruned. Because all variables have been tried at each split, each
individual tree will have high variance and low bias. However, averaging
them reduces the variance.

    ## 
    ## Call:
    ##  randomForest(formula = Rent ~ cluster + size + empl_gr + leasing_rate +      stories + age + renovated + class_a + class_b + green_rating +      net + amenities + cd_total_07 + hd_total07 + Precipitation +      Gas_Costs + Electricity_Costs, data = greenbuildings_train,      mtry = 17, importance = TRUE) 
    ##                Type of random forest: regression
    ##                      Number of trees: 500
    ## No. of variables tried at each split: 17
    ## 
    ##           Mean of squared residuals: 50.80396
    ##                     % Var explained: 77.97

The plot below shows that the bagging procedure can produce quite
accurate predictions most of the time.

![](Exercise3_files/figure-gfm/setup%201.8-1.png)<!-- -->

**Random Forest**

We also ran a random forest model since it is an improvement procedure
over bagging. Random forest also builds decision trees by bootstrapping
the training samples. We again used 500 number of trees to be
bootstrapped. However, instead of considering all variables in each
split, random forest chooses only a set of these variables for the tree
split. We decided to use a square root of the number of the original
variables, which is sqrt(17), approximately 4 variables. Therefore, at
each split, a new sample of these 4 predictors is taken.

By using a different sample of 4 predictors in each split instead of all
17 variables, we avoid the highly correlated predictions that result
from bagging. Random forest produced less correlated predictions. In the
bagging procedure, since all variables are used, majority of trees will
use the strong predictor at the top of tree, which will result in
increased correlation of the predictions. Hence, bagging will usually
not lead to a smaller reduction in variance than random forest because
it averages highly correlated predictions. Therefore, by averaging
uncorrelated quantities, random forest will generally result in a higher
decrease in variance in the average of the resulting trees.

The plot below illustrates the accuracy of the random forest prediction
model.

![](Exercise3_files/figure-gfm/setup%201.9-1.png)<!-- -->

### Comparison of all 5 Predictive Models: Hand-Built Linear Model, Forward Selection, Lasso, Bagging and Random Forest

To compare all five models run so far, we are using a cross validation
performance measure: the Leave-one-out cross validation (LOOCV). Table
1.3 below lists each RMSE found from performing the CV.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

**Table 1.3 LOOCV RMSE per Model**

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:right;">

LOOCV RMSE

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

LOOCV RMSE Rent Hand-Built Model

</td>

<td style="text-align:right;">

11.742609

</td>

</tr>

<tr>

<td style="text-align:left;">

LOOCV RMSE Rent Forward Selection Model

</td>

<td style="text-align:right;">

11.058319

</td>

</tr>

<tr>

<td style="text-align:left;">

LOOCV RMSE Model Lasso Model

</td>

<td style="text-align:right;">

12.125856

</td>

</tr>

<tr>

<td style="text-align:left;">

LOOCV RMSE Model Bagging Model

</td>

<td style="text-align:right;">

7.261572

</td>

</tr>

<tr>

<td style="text-align:left;">

LOOCV RMSE Model RandomForest Model

</td>

<td style="text-align:right;">

7.380760

</td>

</tr>

</tbody>

</table>

**Random Forest as the best predictive model possible**

The tree decision models perform almost twice better than the remaining
three models, based on the RMSE. We decided to use Random Forest as a
predictive model for rent since its does not differ as much from the
RMSE of bagging, and the procedure it uses usually results in an
improvement over bagging as mentioned before.

Below is a list of the variable importance for each variable used in
Random Forest. The first column shows the increase in Mean Squared Error
if that particular variable is omitted from the model. The MSE is
calculated based on the out of bag samples. The second column shows the
increase in node purity that results from splits over that variable. The
increase in node purity is averaged over all trees. As shown below, the
most important variable based on MSE is “age” because if omitted, the
MSE increases the most. However, Electricity costs and Size increase the
most node purity.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

**Table 1.4 Variable Importance in Random Forest Model**

</caption>

<thead>

<tr>

<th style="text-align:left;">

Predictor

</th>

<th style="text-align:right;">

% Increase in MSE

</th>

<th style="text-align:right;">

Increase in Node Purity

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

cluster

</td>

<td style="text-align:right;">

33.67561

</td>

<td style="text-align:right;">

173655.970

</td>

</tr>

<tr>

<td style="text-align:left;">

size

</td>

<td style="text-align:right;">

51.61232

</td>

<td style="text-align:right;">

233627.848

</td>

</tr>

<tr>

<td style="text-align:left;">

empl\_gr

</td>

<td style="text-align:right;">

22.41081

</td>

<td style="text-align:right;">

90028.369

</td>

</tr>

<tr>

<td style="text-align:left;">

leasing\_rate

</td>

<td style="text-align:right;">

48.73707

</td>

<td style="text-align:right;">

135629.774

</td>

</tr>

<tr>

<td style="text-align:left;">

stories

</td>

<td style="text-align:right;">

48.71409

</td>

<td style="text-align:right;">

130973.467

</td>

</tr>

<tr>

<td style="text-align:left;">

age

</td>

<td style="text-align:right;">

56.67080

</td>

<td style="text-align:right;">

133105.855

</td>

</tr>

<tr>

<td style="text-align:left;">

renovated

</td>

<td style="text-align:right;">

24.02045

</td>

<td style="text-align:right;">

20920.776

</td>

</tr>

<tr>

<td style="text-align:left;">

class\_a

</td>

<td style="text-align:right;">

35.99361

</td>

<td style="text-align:right;">

32885.244

</td>

</tr>

<tr>

<td style="text-align:left;">

class\_b

</td>

<td style="text-align:right;">

28.00347

</td>

<td style="text-align:right;">

18816.059

</td>

</tr>

<tr>

<td style="text-align:left;">

green\_rating

</td>

<td style="text-align:right;">

11.80040

</td>

<td style="text-align:right;">

4632.693

</td>

</tr>

<tr>

<td style="text-align:left;">

net

</td>

<td style="text-align:right;">

11.84986

</td>

<td style="text-align:right;">

2827.275

</td>

</tr>

<tr>

<td style="text-align:left;">

amenities

</td>

<td style="text-align:right;">

27.20071

</td>

<td style="text-align:right;">

17033.275

</td>

</tr>

<tr>

<td style="text-align:left;">

cd\_total\_07

</td>

<td style="text-align:right;">

27.77591

</td>

<td style="text-align:right;">

71952.154

</td>

</tr>

<tr>

<td style="text-align:left;">

hd\_total07

</td>

<td style="text-align:right;">

19.91727

</td>

<td style="text-align:right;">

152051.047

</td>

</tr>

<tr>

<td style="text-align:left;">

Precipitation

</td>

<td style="text-align:right;">

20.91840

</td>

<td style="text-align:right;">

100778.783

</td>

</tr>

<tr>

<td style="text-align:left;">

Gas\_Costs

</td>

<td style="text-align:right;">

25.32302

</td>

<td style="text-align:right;">

81242.030

</td>

</tr>

<tr>

<td style="text-align:left;">

Electricity\_Costs

</td>

<td style="text-align:right;">

24.44913

</td>

<td style="text-align:right;">

241126.265

</td>

</tr>

</tbody>

</table>

### The Effect of Green Rating on Rent

Figure 1.5 illustrates the partial dependence plot of the marginal
effect that the green rating has on the outcome of Random Forest.

![](Exercise3_files/figure-gfm/setup%201.12-1.png)<!-- -->

It is difficlut to esitmate the partial effect of green\_rating on rent
in a random forest model since tree based models are nonlinear in
coefficients. So, by random forest, we can only find approximation to
the average effect of green\_rating.

To find the average change in rental income per square foot considering
green ratings and holding all other variables fixed, we calculated the
difference between predicted values given a green rating and a non-green
rating keeping all other variables the same. (Since green ratings is a
dummy variable, to find the effect of the variable, we subtracted all
predicted values given green\_rating=0 from predicted values given
green\_rating=1, holding all other variables constant.) Afterwards, we
took the average of the differences of predicted values to find the
average effect of green ratings on rent price. Therefore, the average
effect of green ratings on the rent price is approximately “0.3”. This
means that if the building is green then the rent will be on average 0.3
dollars per square foot per calendar year more expensive than if the
building is non-green, holding all else fixed.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

**Table 1.4 Average Effect on the Green Rating Variable on Rent**

</caption>

<thead>

<tr>

<th style="text-align:right;">

Average Green Rating Effect on Rent

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:right;">

0.2882893

</td>

</tr>

</tbody>

</table>

### Conclusions:

1)  The best predictive models possible for price are the tree-based
    models, Random Forest and Bagging;
2)  The average change in rental income per square foot associated with
    green certification, holding other features of the building
    constant, is 0.3 dollars per square foot.

# Problem 2. What causes what?

### Question 1: Why can’t I just get data from a few different cities and run the regression of “Crime” on “Police” to understand how more cops in the streets affect crime? (“Crime” refers to some measure of crime rate and “Police” measures the number of cops in a city.)

It is not a good practice to just collect data from different cities and
run a regression of “Crime” on “Police” because of the correlation
vs. causality problem. Crime does not depend only on the amount of
police force hired but also on other different factors, which should be
accounted for. For instance, different locations have different
demographics and crime challenges. Hence, these social and economic
factors need to be accounted for before running a regression on “Crime”.
However, if running a multiple regression of “Crime” on “Police” and
other factors, the problem of causality is still not resolved. For
example, bigger cities have in general more crime, therefore, they hire
more police officers, so there is a positive correlation which does not
determine causality between the two variables.

### Question 2: How were the researchers from UPenn able to isolate this effect? Briefly describe their approach and discuss their result in the “Table 2” below, from the researchers’ paper.

To isolate the effect of police on crime, the researchers employed
natural experiment. They observed an event where the high amount of
police officers on the streets was not caused by the crime levels in the
city. The researchers’ strategy was to use the terrorism alert system,
specifically in Washington, D.C. as a control variable. In D.C. the
terrorist alert system makes use of colors for the level of terrorist
alert, so when the alert goes to orange, more police officers are around
the city to protect against potential terror attacks. In this natural
experiment, the researchers assume that street crime and terrorism
threat are unrelated, hence, the increase in D.C. police force is
“exogenous” to the conventional crime rate.

The researchers observed that the number of crimes committed when the
color alert was “Orange” was lower than when the terrorism alert level
was “Yellow”. The orange terrorism alert requires more police officers
than the yellow alert. In addition, the researchers found that the
decrease in crime was sharpest in the area where there were the most
police officers assigned. Therefore, they were able to answer the
question of the effect of police officers on crime by observing a
natural experiment and assigning a variable that controls for the amount
of police officers assigned in Washington, D.C. for a reason unrelated
to crime.

As Table 2 suggests, by running a basic regression, the researches have
concluded that on high-alert days, total crime decreases by an average
of 7 crimes per day. Controlling for the Metro passengers, the
regression gives a result of an average decrease of 6 crimes per day.

### Question 3: Why did they have to control for Metro ridership? What was that trying to capture?

The reason why the researchers are controlling for the Metro system
ridership is to address the issue of an alternative hypothesis that
tourism is reduced during high terrorist alert days, consequently, that
can be the cause of the lower crime levels, not the increase police
force. However, when the researchers have examined the daily data on the
number of passengers using the Metro system during high alert terror
days, they have found that the flock of riders has not been
significantly diminished during these days.

As seen from Table 2, the researchers found that changes in Metro riders
is somehow correlated with the crime levels, but the correlation is very
small: a 10% increase in the amount of passengers increases crime by
only around 1.7 per day on average. Consequently, changes in the number
of tourists cannot fully explain the change in crime, so there is no
significant causal effect of the change in tourists on the crime levels
in D.C. during high alert days when police force increases.

### Question 4: Below I am showing you “Table 4” from the researchers’ paper. Just focus on the first column of the table. Can you describe the model being estimated here? What is the conclusion?

The researchers have split Washington, D.C. into different districts
because each district of a city is likely to have varying crime
statistics, population income, educational level, and other
socio-demographic factors that differ in each district. From table 4, it
can be concluded that District 1 is likely to have the most increased
police attention because it has the highest threat of a terrorist
attack. Given that District 1 is comprised of the White House, Congress
and other prominent government agencies, the researchers have run a
regression on District 1 as a separate variable and all other districts
because it is expected that most of the police force will be
concentrated around District 1.

Table 4 suggests that a fixed effect regression has been run with
district fixed effects to control for differences in the districts of
Washington, D.C. Looking at the first column of table 4, during days of
high alert, crime in District 1 is expected to decrease by approximately
2.62, while in other districts by only 0.571. However, the coefficient
of other districts is not statistically significant. As it can be seen,
controlling for districts fixed effects also decreases the coefficient
Metro ridership and makes it less statistically significant than the
regression from Table 2. Comparing the results from Questions 2 and 3,
where researchers have been concentrated on the whole city, it can be
concluded that most of the crime decline is concentrated in District 1.

The researchers suggest that the low decrease in crime in other
districts can be due to the fact that the city police department may be
diverting resources from other districts to District 1, hence, there may
be actually a decreased police presence in some districts during high
alert days.

In conclusion, the regressions run in both tables: Table 1 and Table 2
show evidence of decrease in crime when police presence is increased,
establishing a causal relationship between police and crime by running a
natural experiment where increased police presence is due to other
factors than street crime.

# Problem 3: Clustering and PCA

## Overview

In this exercise we are interested in applying and comparing
unsupervised learning methods like K-means clustering and Principal
Component Analysis to see whether they can successfully distinguish the
red wines from the white wines, as well as sorting the higher from the
lower quality of wines based on the dataset with 11 chemical properties
of 6500 different bottles of vinho verde wine from northern Portugal.

## Application of unsupervised learning methods to distinguish red wines from white wines

As a first step, the variables are explored to learn by which chemical
properties the white and red wines differentiate most.

![](Exercise3_files/figure-gfm/Figure%201.%20boxplot_colors-1.png)<!-- -->

From these boxplots, it can be concluded that red and white wines
differentiate mostly by chemical properties like total sulphur dioxide,
residual sugar, volatile acidity and density. These features will be
used later to analyze the performance of the selected methods.

#### K-means clustering to distinguish colors of wine

K-means clustering was chosen as a first approach to differentiate the
two types of wines by color. Accordingly, we set the number of clusters
K in K-means as 2.Then we run K-means on 11 chemical properties(the
first 11 columns of the dataset).

The following two figures show visually that K-means clustering could
successfully differentiate two colors of wines in relation to four
chemical properties, by which red and white wines differentiate mostly.
Additionally, in the first figure of boxplots we noticed that two colors
of wines didn’t differentiate much in the other chemical features. For
this reason we chose to show visually the performance of K-means
clustering on these four chemical features. For example, in the Figure
3.2. the top panel shows how k-means clustering partitioned the data
into two clusters in the dimensions of fixed acidity and residual sugar.
The bottom panel shows how actual wine colors differentiate in these
dimensions. It can be inferred, that the two panels appear to be very
similar visually. Figure 3.3. follows similar pattern.

![](Exercise3_files/figure-gfm/figure%203.2-3.3.%20K-means_colors-1.png)<!-- -->![](Exercise3_files/figure-gfm/figure%203.2-3.3.%20K-means_colors-2.png)<!-- -->

#### Prinicipal Components Analysis (PCA) to distinguish colors of wine

Next, Prinipal Components Analysis was performed in a similar attempt to
distinguish the wines by two colors. The table below shows that the
first five principal components explain cumulatively about 80% of the
variation in the data.

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">

<caption>

**Table 3.1. Summary table of PCA to distinguish colors**

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:right;">

PC1

</th>

<th style="text-align:right;">

PC2

</th>

<th style="text-align:right;">

PC3

</th>

<th style="text-align:right;">

PC4

</th>

<th style="text-align:right;">

PC5

</th>

<th style="text-align:right;">

PC6

</th>

<th style="text-align:right;">

PC7

</th>

<th style="text-align:right;">

PC8

</th>

<th style="text-align:right;">

PC9

</th>

<th style="text-align:right;">

PC10

</th>

<th style="text-align:right;">

PC11

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Standard deviation

</td>

<td style="text-align:right;">

1.740652

</td>

<td style="text-align:right;">

1.579185

</td>

<td style="text-align:right;">

1.247536

</td>

<td style="text-align:right;">

0.985166

</td>

<td style="text-align:right;">

0.8484544

</td>

<td style="text-align:right;">

0.7793021

</td>

<td style="text-align:right;">

0.7232971

</td>

<td style="text-align:right;">

0.7081739

</td>

<td style="text-align:right;">

0.5805377

</td>

<td style="text-align:right;">

0.4771748

</td>

<td style="text-align:right;">

0.1811927

</td>

</tr>

<tr>

<td style="text-align:left;">

Proportion of Variance

</td>

<td style="text-align:right;">

0.275440

</td>

<td style="text-align:right;">

0.226710

</td>

<td style="text-align:right;">

0.141490

</td>

<td style="text-align:right;">

0.088230

</td>

<td style="text-align:right;">

0.0654400

</td>

<td style="text-align:right;">

0.0552100

</td>

<td style="text-align:right;">

0.0475600

</td>

<td style="text-align:right;">

0.0455900

</td>

<td style="text-align:right;">

0.0306400

</td>

<td style="text-align:right;">

0.0207000

</td>

<td style="text-align:right;">

0.0029800

</td>

</tr>

<tr>

<td style="text-align:left;">

Cumulative Proportion

</td>

<td style="text-align:right;">

0.275440

</td>

<td style="text-align:right;">

0.502150

</td>

<td style="text-align:right;">

0.643640

</td>

<td style="text-align:right;">

0.731870

</td>

<td style="text-align:right;">

0.7973200

</td>

<td style="text-align:right;">

0.8525300

</td>

<td style="text-align:right;">

0.9000900

</td>

<td style="text-align:right;">

0.9456800

</td>

<td style="text-align:right;">

0.9763200

</td>

<td style="text-align:right;">

0.9970200

</td>

<td style="text-align:right;">

1.0000000

</td>

</tr>

</tbody>

</table>

![](Exercise3_files/figure-gfm/summary_pcw1,%20figure%203.4.%20PVE%20of%20pca-1.png)<!-- -->

Below we can examine the loadings of the first 5 principal components.
These are the linear combinations of the original chemical properties,
which preserve as much of the information of those variables as
possible. For example, free sulfur dioxide and total sulfur dioxide are
relatively strongly and positively correlated with the first principal
component, whereas volatile acidity and sulphates are relatively
strongly and negatively correlated with the first principal component.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

**Table 3.2. Loadings of the first five principal components**

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:right;">

PC1

</th>

<th style="text-align:right;">

PC2

</th>

<th style="text-align:right;">

PC3

</th>

<th style="text-align:right;">

PC4

</th>

<th style="text-align:right;">

PC5

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

fixed.acidity

</td>

<td style="text-align:right;">

\-0.24

</td>

<td style="text-align:right;">

0.34

</td>

<td style="text-align:right;">

\-0.43

</td>

<td style="text-align:right;">

0.16

</td>

<td style="text-align:right;">

\-0.15

</td>

</tr>

<tr>

<td style="text-align:left;">

volatile.acidity

</td>

<td style="text-align:right;">

\-0.38

</td>

<td style="text-align:right;">

0.12

</td>

<td style="text-align:right;">

0.31

</td>

<td style="text-align:right;">

0.21

</td>

<td style="text-align:right;">

0.15

</td>

</tr>

<tr>

<td style="text-align:left;">

citric.acid

</td>

<td style="text-align:right;">

0.15

</td>

<td style="text-align:right;">

0.18

</td>

<td style="text-align:right;">

\-0.59

</td>

<td style="text-align:right;">

\-0.26

</td>

<td style="text-align:right;">

\-0.16

</td>

</tr>

<tr>

<td style="text-align:left;">

residual.sugar

</td>

<td style="text-align:right;">

0.35

</td>

<td style="text-align:right;">

0.33

</td>

<td style="text-align:right;">

0.16

</td>

<td style="text-align:right;">

0.17

</td>

<td style="text-align:right;">

\-0.35

</td>

</tr>

<tr>

<td style="text-align:left;">

chlorides

</td>

<td style="text-align:right;">

\-0.29

</td>

<td style="text-align:right;">

0.32

</td>

<td style="text-align:right;">

0.02

</td>

<td style="text-align:right;">

\-0.24

</td>

<td style="text-align:right;">

0.61

</td>

</tr>

<tr>

<td style="text-align:left;">

free.sulfur.dioxide

</td>

<td style="text-align:right;">

0.43

</td>

<td style="text-align:right;">

0.07

</td>

<td style="text-align:right;">

0.13

</td>

<td style="text-align:right;">

\-0.36

</td>

<td style="text-align:right;">

0.22

</td>

</tr>

<tr>

<td style="text-align:left;">

total.sulfur.dioxide

</td>

<td style="text-align:right;">

0.49

</td>

<td style="text-align:right;">

0.09

</td>

<td style="text-align:right;">

0.11

</td>

<td style="text-align:right;">

\-0.21

</td>

<td style="text-align:right;">

0.16

</td>

</tr>

<tr>

<td style="text-align:left;">

density

</td>

<td style="text-align:right;">

\-0.04

</td>

<td style="text-align:right;">

0.58

</td>

<td style="text-align:right;">

0.18

</td>

<td style="text-align:right;">

0.07

</td>

<td style="text-align:right;">

\-0.31

</td>

</tr>

<tr>

<td style="text-align:left;">

pH

</td>

<td style="text-align:right;">

\-0.22

</td>

<td style="text-align:right;">

\-0.16

</td>

<td style="text-align:right;">

0.46

</td>

<td style="text-align:right;">

\-0.41

</td>

<td style="text-align:right;">

\-0.45

</td>

</tr>

<tr>

<td style="text-align:left;">

sulphates

</td>

<td style="text-align:right;">

\-0.29

</td>

<td style="text-align:right;">

0.19

</td>

<td style="text-align:right;">

\-0.07

</td>

<td style="text-align:right;">

\-0.64

</td>

<td style="text-align:right;">

\-0.14

</td>

</tr>

<tr>

<td style="text-align:left;">

alcohol

</td>

<td style="text-align:right;">

\-0.11

</td>

<td style="text-align:right;">

\-0.47

</td>

<td style="text-align:right;">

\-0.26

</td>

<td style="text-align:right;">

\-0.11

</td>

<td style="text-align:right;">

\-0.19

</td>

</tr>

</tbody>

</table>

Next, answering the question of where the individual data points fall in
the space defined by first two principal components can help us identify
how PCA performed the clustering of wines by their color.

![](Exercise3_files/figure-gfm/figure%201.5.%20pca%20for%20wine%20colors%20-1.png)<!-- -->

As it can be seen from the plot above, PCA could also perform the
clustering of two types of wine. Mainly, white wines tend to cluster to
the positive direction in the dimension of first principal component,
whereas red wines tend to cluster in the opposite direction.

Further, PCA results can be used to perform K-means clustering based on
them. We performed the K-means clustering on the first five principal
components to check whether we can enhance the partitioning of wine
color done by K-means. Figure 3.6. illustrates that differentiation of
wine colors was done very successfully by these augmented k-means
clustering method.

![](Exercise3_files/figure-gfm/k-means%20via%20pca%20colors-1.png)<!-- -->

Table 3.3. compares the results of two clustering of K=2 based on the
total within-cluster sum of squares and the between-cluster sum of
squares. Clustering via PCA has a relative improvement of about 25% in
the total within-cluster sum of squares, and approximately the same
between-cluster sum of squares.

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

**Table 3.3 : Evaluating in-sample fit of two clusterings**

</caption>

<tbody>

<tr>

<td style="text-align:left;">

Total within-cluster sum of squares of Basic clustering

</td>

<td style="text-align:right;">

56135.28

</td>

</tr>

<tr>

<td style="text-align:left;">

Total within-cluster sum of squares of Clustering via PCA

</td>

<td style="text-align:right;">

41760.19

</td>

</tr>

<tr>

<td style="text-align:left;">

Between-cluster sum of squares of Basic clustering

</td>

<td style="text-align:right;">

15320.72

</td>

</tr>

<tr>

<td style="text-align:left;">

Between-cluster sum of squares of Clustering via PCA

</td>

<td style="text-align:right;">

15212.77

</td>

</tr>

</tbody>

</table>

To sum up, it can be said that K-means and PCA could succesfully
differentiate the white and red wines using only the “unsupervised
information” contained in the data on chemical properties of wines.
However, by reducing the dimensions of the features of the dataset by
PCA and then applying K-means clustering could distinguish colors of
wine at even better level, which could be seen from the reduced
within-cluster sum of squares.

## Application of unsupervised learning methods to distinguish quality levels of wines

Before applying the unsupervised learning methods to sort the higher
levels of wines from the lower levels, we can look at the distribution
of various wine quality levels in this dataset.
![](Exercise3_files/figure-gfm/Figure%203.7.%20histogram%20of%20quality%20levels-1.png)<!-- -->

The figure 3.7. shows that there are 7 different qualities of wines in
the data. As we are specifically interested in distinguishing between
higher types of wines from the lower types, we have divided the wines
into three main levels of qualities. Wines that scored higher that 7
were defined as high quality wines, lower than 5 - as low quality and
from 5 to 7 as medium quality wines. As a next step, variables were
explored to know by which chemical properties wine quality levels
differentiate most.

![](Exercise3_files/figure-gfm/Figure%203.8.%20Boxplots%20of%20chemical%20prop%20qualities-1.png)<!-- -->

From these boxplots, it can be concluded that higher and lower quality
wines differentiate mostly by chemical properties like volatile acidity,
alcohol, free sulfur dioxide and chlorides. These features will be used
later to analyze the performance of the selected methods.

#### K-means clustering to distinguish between higher and lower quality levels of wines

K-means clustering was performed to test whether it can also
differentiate the types of wines by quality level. As we have three main
levels of qualities, accordingly the number of clusters K in K-means is
3.

The following set of figures show visually results of K-means clustering
in differentiating the qualities of wines in relation to four chemical
properties. For example, in the Figure 3.9. the top left plot shows how
k-means clustering partitioned the data into three clusters in the
dimensions of volatile acidity and alcohol. The middle left plot shows
how actual three wine quality levels differentiate in these dimensions.
It is difficult to see, how lower and higher quality wines differ,
because of the huge amount of middle quality wines that overlap with
them, so the bottom left plot shows only the high and low qualities of
wines in these dimensions. Although, the distribution pattern of low and
high qualities appear to be similar with red and green clusters in the
top plot, it cannot be said that they follow exact pattern as was in the
case of partitioning the colors of wine. The right panel shows this
comparison in the dimensions of other two chemical features.

![](Exercise3_files/figure-gfm/Figure%203.9%20K-means%20for%20qualities-1.png)<!-- -->

#### Prinicipal Components Analysis (PCA) to distinguish between higher and lower quality levels of wines

Next, Prinipal Components Analysis was performed in a similar attempt to
distinguish the quality levels of wines. From the previous PCA on wine
colors it is known that the first five principal components explain
cumulatively about 80% of the variation in the data. As before,by
answering the question of where the individual data points fall in the
space defined by first two principal components we can identify how PCA
performed the clustering of wines by their quality levels.

![](Exercise3_files/figure-gfm/figure%203.10.%20pca%20qualities-1.png)<!-- -->

As it can be seen from the plot above, now PCA couldn’t perform the
clustering of higher qualities of wine from the lower types in a very
distinctive way. Mainly, higher types of wines tend to cluster to the
right spectrum of the dimension of first principal component, whereas
lower quality wines tend to cluster in the left.

With the same procedure as before, PCA results were used to perform
K-means clustering based on them. We performed the K-means clustering on
the first five principal components to check whether partitioning of
wine quality types done by K-means could be enhanced. Figure 3.11
illustrates that differentiation of wines by quality types was done at a
better level by these augmented k-means clustering method. For example,
the top left plot shows how k-means clustering partitioned the data into
three clusters in the dimensions of volatile acidity and alcohol. The
middle left plot shows how actual three wine quality levels
differentiate in these dimensions. It is difficult to see, how lower and
higher quality wines differ, because of the huge amount of middle
quality wines that overlap with them, so the bottom left plot shows only
the high and low qualities of wines in these dimensions. Although the
distribution pattern of low and high qualities appears to be similar
with blue and green clusters in the top plot, it cannot be said that
they follow exact same pattern. The right panel shows this comparison in
the dimensions of other two chemical features like chlorides and free
sulfur dioxide.

![](Exercise3_files/figure-gfm/figure%203.11.%20k-means%20via%20pca%20qualities-1.png)<!-- -->

Table 3.4. compares the results of two clustering with K=3 based on the
total within-cluster sum of squares and the between-cluster sum of
squares. Clustering via PCA has a relative improvement of about 31% in
the total within-cluster sum of squares, and approximately the same
between-cluster sum of squares.

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

**Table 3.4 : Evaluating in-sample fit of two clusterings**

</caption>

<tbody>

<tr>

<td style="text-align:left;">

Total within-cluster sum of squares of Basic clustering

</td>

<td style="text-align:right;">

45569.97

</td>

</tr>

<tr>

<td style="text-align:left;">

Total within-cluster sum of squares of Clustering via PCA

</td>

<td style="text-align:right;">

31258.71

</td>

</tr>

<tr>

<td style="text-align:left;">

Between-cluster sum of squares of Basic clustering

</td>

<td style="text-align:right;">

25886.03

</td>

</tr>

<tr>

<td style="text-align:left;">

Between-cluster sum of squares of Clustering via PCA

</td>

<td style="text-align:right;">

25714.25

</td>

</tr>

</tbody>

</table>

To sum up, it can be said that neither K-means clustering nor PCA could
very succesfully differentiate the higher from the lower quality wines
using only the “unsupervised information” contained in the data on
chemical properties of wines. However, by reducing the dimensions of the
features of the dataset by PCA and then applying K-means clustering
could distinguish quality levels of wine at better level, which could be
seen from the reduced within-cluster sum of squares.

## Conclusion

In conclusion, we could say that K-means clustering applied together
with PCA as a dimensionality reduction technique for the chemical
properties of wines works better to differentiate the red and white
colors of wine, compared to the same technique to distinguish higher
from the lower quality wines.

# Problem 4: Market Segmentation

## Overview

Based on data of the its twitter account followers, the brand
“NutrientH20” tries to find out possible approaches to segment those
followers. The key for our market segmentation purpose is to find some
identifiers to identify different clusters of consumers so that
NutrientH20 can target its consumers more accurately in marketing or
advertising. In analysis, we used three approaches to get there:
K-means, Principal Component Analysis (PCA) with Hierarchical
Clustering, and Hierarchical Clustering with K-means. The first two
aimed at doing general market segmentation, and the third aimed at
giving the previous clusters more accurate labels.

## The Data

The data contains 7828 twitter followers (consumers) and 36 categories
of their twitter posts (tweets). For each follower, the data gives the
amount of tweets in each category, during seven days in June 2014.
First, we deleted the observations with either nonzero “spam” tweets or
nonzero “adult” tweets since most of those two kinds of tweets are
likely posted by robots that are meaningless followers for marketing
analysis. Then, we deleted “spam “and “adult”. At last, we transformed
the number of tweets in each category into the frequency of tweets
belonging to each category to better represent the preferences of
consumers. After doing all these, we got a dataset with 7309 consumers
(rows) and 34 categories.

## K-means

### The Proper K

K-means is a method to partition observations or features with a high
dimension P into lower K dimensions (P\>=K). For our purpose, it is to
partition 7309 consumers into K clusters. We used CH index to choose a
proper value of K.

![](Exercise3_files/figure-gfm/setup%204.1-1.png)<!-- -->

The Figure 4.1 is the elbow plot of CH index. It is not so
straightforward to choose a vivid elbow from the graph. Generally,
values of K ranged from 10 to 15 seemed to be good candidates. To make
the clustering as parsimonious as possible, we chose K = 10.

### The Result of K-means

K-means gave us 10 stable clusters of consumers. Then, for each cluster,
we calculated the sum of frequencies of each category over all consumers
in that cluster. After ordering the categories by sums of frequencies,
the first five categories with higher sums of frequencies were picked
out to represent that cluster. Also, the number of consumers in each
cluster was counted. The ultimate result is shown in Table 4.1.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

**Table 4.1: Ten Clusters of K-means**

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:left;">

Category 1

</th>

<th style="text-align:left;">

Category 2

</th>

<th style="text-align:left;">

Category 3

</th>

<th style="text-align:left;">

Category 4

</th>

<th style="text-align:left;">

Category 5

</th>

<th style="text-align:left;">

Consumer No. 

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Cluster 1

</td>

<td style="text-align:left;">

sports\_fandom

</td>

<td style="text-align:left;">

religion

</td>

<td style="text-align:left;">

food

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

parenting

</td>

<td style="text-align:left;">

967

</td>

</tr>

<tr>

<td style="text-align:left;">

Cluster 2

</td>

<td style="text-align:left;">

cooking

</td>

<td style="text-align:left;">

photo\_sharing

</td>

<td style="text-align:left;">

fashion

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

beauty

</td>

<td style="text-align:left;">

734

</td>

</tr>

<tr>

<td style="text-align:left;">

Cluster 3

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

tv\_film

</td>

<td style="text-align:left;">

college\_uni

</td>

<td style="text-align:left;">

current\_events

</td>

<td style="text-align:left;">

music

</td>

<td style="text-align:left;">

603

</td>

</tr>

<tr>

<td style="text-align:left;">

Cluster 4

</td>

<td style="text-align:left;">

news

</td>

<td style="text-align:left;">

politics

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

automotive

</td>

<td style="text-align:left;">

sports\_fandom

</td>

<td style="text-align:left;">

582

</td>

</tr>

<tr>

<td style="text-align:left;">

Cluster 5

</td>

<td style="text-align:left;">

politics

</td>

<td style="text-align:left;">

travel

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

computers

</td>

<td style="text-align:left;">

news

</td>

<td style="text-align:left;">

553

</td>

</tr>

<tr>

<td style="text-align:left;">

Cluster 6

</td>

<td style="text-align:left;">

college\_uni

</td>

<td style="text-align:left;">

online\_gaming

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

photo\_sharing

</td>

<td style="text-align:left;">

sports\_playing

</td>

<td style="text-align:left;">

507

</td>

</tr>

<tr>

<td style="text-align:left;">

Cluster 7

</td>

<td style="text-align:left;">

art

</td>

<td style="text-align:left;">

tv\_film

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

current\_events

</td>

<td style="text-align:left;">

travel

</td>

<td style="text-align:left;">

346

</td>

</tr>

<tr>

<td style="text-align:left;">

Cluster 8

</td>

<td style="text-align:left;">

dating

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

photo\_sharing

</td>

<td style="text-align:left;">

fashion

</td>

<td style="text-align:left;">

school

</td>

<td style="text-align:left;">

275

</td>

</tr>

<tr>

<td style="text-align:left;">

Cluster 9

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

photo\_sharing

</td>

<td style="text-align:left;">

shopping

</td>

<td style="text-align:left;">

current\_events

</td>

<td style="text-align:left;">

travel

</td>

<td style="text-align:left;">

1564

</td>

</tr>

<tr>

<td style="text-align:left;">

Cluster 10

</td>

<td style="text-align:left;">

health\_nutrition

</td>

<td style="text-align:left;">

personal\_fitness

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

cooking

</td>

<td style="text-align:left;">

outdoors

</td>

<td style="text-align:left;">

1178

</td>

</tr>

</tbody>

</table>

We briefed those clusters below.

**Cluster 1** (967 consumers): sports\_fandom, religion, food, chatter,
parenting (This cluster probably had more parents and adults with
relatively greater ages.)

**Cluster 2** (734 consumers): cooking, photo\_sharing, fashion,
chatter, beauty (This cluster probably contained more consumres
interested in leisure and lifestyle.)

**Cluster 3** (603 consumers): chatter, tv\_film, college\_uni,
current\_events, music (This cluster had more college student interested
in movie, TV shows, and music.)

**Cluster 4** (582 consumers): news, politics, chatter, automotive,
sports\_fandom (This cluster focused more on news and politics.)

**Cluster 5** (553 consumers): politics, travel, chatter, computers,
news (This cluster had consumers interested in topics like politics,
travel, and computers. They also cared about news.)

**Cluster 6** (507 consumers): college\_uni, online\_gaming, chatter,
photo\_sharing, sports\_playing (This cluster more likely contained many
college students interested in online gaming and online socializing.)

**Cluster 7** (346 consumers): art, tv\_film, chatter, current\_events,
travel (This cluster had consumers interested in arts, movies, TV shows,
and probably viral events.)

**Cluster 8** (275 consumers): dating, chatter, photo\_sharing, fashion,
school (This cluster also had many students, but probably relatively
younger.)

**Cluster 9** (1564 consumers): chatter, photo\_sharing, shopping,
current\_events, travel (This cluster had consumers doing typical
twitter related activities.)

**Cluster 10** (1178 consumers): health\_nutrition, personal\_fitness,
chatter, cooking, outdoors (This cluster had consumers interested in
health, workout, and outdoor activities.)

In addition, chatter was a common preference over most clusters.

## 4.4 The Principal Component Analysis (PCA) + Hierarchical Clustering

### Choose a Scaled Dataset and the Number of Principal Components

Next, we did segmentation by PCA. Since PCA is sensitive to the scales
of data to some degree, before choosing a proper number of principal
components, the first thing to do is to compare the effects of
differently scaled data on PCA. We used three differently scaled
datasets to do that. The first dataset was the one transformed into
frequencies. The second one was gotten by doing zero-mean
standardization on the frequency dataset. The third one was gotten from
doing zero-mean standardization on the original dataset, the one before
doing frequency transformation. PVE, the proportion of variance of each
principal component, was calculated after doing PCA on each dataset. The
Figure 4.1 shows how PVE of each dataset varies with each principal
component, where the blue line corresponds to the first dataset, the red
line corresponds to the second dataset, and the green one corresponds to
the third dataset. Around the elbow part where the number of principal
components is about eight to twelve, the blue line has the lowest
position, which means the first several principal components of blue one
summarize more variance in data. Hence, we chose the frequency dataset
to do PCA.

![](Exercise3_files/figure-gfm/setup%204.3-1.png)<!-- -->

Also based on the location of elbow in Figure 4.2, the first ten
principal components were chosen as a proper summary of data. Table 4.2
also justifies our choosing: the first ten principal components include
around 73.4 percent variation in data, which means the rest twenty-four
principal components only represent 26.6 percent variation in data. So,
we believe that the first ten are representative enough for the data.

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">

<caption>

**Table 4.2: Summary of Variations in Principal Components**

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:right;">

PC1

</th>

<th style="text-align:right;">

PC2

</th>

<th style="text-align:right;">

PC3

</th>

<th style="text-align:right;">

PC4

</th>

<th style="text-align:right;">

PC5

</th>

<th style="text-align:right;">

PC6

</th>

<th style="text-align:right;">

PC7

</th>

<th style="text-align:right;">

PC8

</th>

<th style="text-align:right;">

PC9

</th>

<th style="text-align:right;">

PC10

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Standard deviation

</td>

<td style="text-align:right;">

0.1095786

</td>

<td style="text-align:right;">

0.0932282

</td>

<td style="text-align:right;">

0.0783741

</td>

<td style="text-align:right;">

0.0741907

</td>

<td style="text-align:right;">

0.0685512

</td>

<td style="text-align:right;">

0.054322

</td>

<td style="text-align:right;">

0.0526156

</td>

<td style="text-align:right;">

0.0491107

</td>

<td style="text-align:right;">

0.0443279

</td>

<td style="text-align:right;">

0.0401458

</td>

</tr>

<tr>

<td style="text-align:left;">

Proportion of Variance

</td>

<td style="text-align:right;">

0.1808800

</td>

<td style="text-align:right;">

0.1309300

</td>

<td style="text-align:right;">

0.0925300

</td>

<td style="text-align:right;">

0.0829200

</td>

<td style="text-align:right;">

0.0707900

</td>

<td style="text-align:right;">

0.044450

</td>

<td style="text-align:right;">

0.0417000

</td>

<td style="text-align:right;">

0.0363300

</td>

<td style="text-align:right;">

0.0296000

</td>

<td style="text-align:right;">

0.0242800

</td>

</tr>

<tr>

<td style="text-align:left;">

Cumulative Proportion

</td>

<td style="text-align:right;">

0.1808800

</td>

<td style="text-align:right;">

0.3118100

</td>

<td style="text-align:right;">

0.4043300

</td>

<td style="text-align:right;">

0.4872500

</td>

<td style="text-align:right;">

0.5580400

</td>

<td style="text-align:right;">

0.602490

</td>

<td style="text-align:right;">

0.6441900

</td>

<td style="text-align:right;">

0.6805300

</td>

<td style="text-align:right;">

0.7101200

</td>

<td style="text-align:right;">

0.7344000

</td>

</tr>

</tbody>

</table>

### The Potential Problems of First Ten Principal Components

The first ten principal components can be used to differentiate
consumers. In each principal component, the importance of categories was
measured by loadings. Those categories assigned with high positive
loadings were supposed to be closer to each other than other categories
so that they were more likely to be in the same cluster.The result was
presented in Table 4.3.

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">

<caption>

**Table 4.3: The Result of First 10 Principal Components**

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:left;">

PC 1

</th>

<th style="text-align:left;">

PC 2

</th>

<th style="text-align:left;">

PC 3

</th>

<th style="text-align:left;">

PC 4

</th>

<th style="text-align:left;">

PC 5

</th>

<th style="text-align:left;">

PC 6

</th>

<th style="text-align:left;">

PC 7

</th>

<th style="text-align:left;">

PC 8

</th>

<th style="text-align:left;">

PC 9

</th>

<th style="text-align:left;">

PC 10

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Category 1

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

health\_nutrition

</td>

<td style="text-align:left;">

college\_uni

</td>

<td style="text-align:left;">

college\_uni

</td>

<td style="text-align:left;">

politics

</td>

<td style="text-align:left;">

tv\_film

</td>

<td style="text-align:left;">

tv\_film

</td>

<td style="text-align:left;">

travel

</td>

<td style="text-align:left;">

current\_events

</td>

<td style="text-align:left;">

cooking

</td>

</tr>

<tr>

<td style="text-align:left;">

Category 2

</td>

<td style="text-align:left;">

photo\_sharing

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

online\_gaming

</td>

<td style="text-align:left;">

online\_gaming

</td>

<td style="text-align:left;">

travel

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

photo\_sharing

</td>

<td style="text-align:left;">

religion

</td>

<td style="text-align:left;">

online\_gaming

</td>

<td style="text-align:left;">

sports\_fandom

</td>

</tr>

<tr>

<td style="text-align:left;">

Category 3

</td>

<td style="text-align:left;">

shopping

</td>

<td style="text-align:left;">

personal\_fitness

</td>

<td style="text-align:left;">

cooking

</td>

<td style="text-align:left;">

health\_nutrition

</td>

<td style="text-align:left;">

cooking

</td>

<td style="text-align:left;">

cooking

</td>

<td style="text-align:left;">

current\_events

</td>

<td style="text-align:left;">

computers

</td>

<td style="text-align:left;">

family

</td>

<td style="text-align:left;">

tv\_film

</td>

</tr>

<tr>

<td style="text-align:left;">

Category 4

</td>

<td style="text-align:left;">

current\_events

</td>

<td style="text-align:left;">

photo\_sharing

</td>

<td style="text-align:left;">

photo\_sharing

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

college\_uni

</td>

<td style="text-align:left;">

current\_events

</td>

<td style="text-align:left;">

art

</td>

<td style="text-align:left;">

food

</td>

<td style="text-align:left;">

sports\_fandom

</td>

<td style="text-align:left;">

shopping

</td>

</tr>

<tr>

<td style="text-align:left;">

Category 5

</td>

<td style="text-align:left;">

travel

</td>

<td style="text-align:left;">

shopping

</td>

<td style="text-align:left;">

fashion

</td>

<td style="text-align:left;">

personal\_fitness

</td>

<td style="text-align:left;">

online\_gaming

</td>

<td style="text-align:left;">

travel

</td>

<td style="text-align:left;">

travel

</td>

<td style="text-align:left;">

parenting

</td>

<td style="text-align:left;">

sports\_playing

</td>

<td style="text-align:left;">

college\_uni

</td>

</tr>

</tbody>

</table>

But there are two problems in the above result: it includes only 21
categories out of 34, and we do not know yet how many consumers have the
bigest interest in each cluster and who they are, which makes us a few
miles away from our destination.

### Use Hierarchical Clustering to Make a Better Clustering

To solve the problems, we used the scores (indices to indicate the
positions of each observation in the projected space) of PCA to
construct a distance matrix, which measures the distance between each
pair of consumers in the data. By Hierarchical Clustering and cutting
the resulting dendrogram, we got 10 clusters of consumers, in accordance
with the value of K in K-means. Afterwards, we did the same thing as in
K-means after getting 10 clusters. The result is shown in Table 4.4 (To
be more distinguishable, we named the clusters as “Pcluster” here). It
is the exactly same as in K-means, which strongly implies the robustness
of partitioning the market into 10 clusters.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

**Table 4.4: An Improved Result of Hierarchical Clustering**

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:left;">

Category 1

</th>

<th style="text-align:left;">

Category 2

</th>

<th style="text-align:left;">

Category 3

</th>

<th style="text-align:left;">

Category 4

</th>

<th style="text-align:left;">

Category 5

</th>

<th style="text-align:left;">

Consumer No. 

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

PCluster 1

</td>

<td style="text-align:left;">

sports\_fandom

</td>

<td style="text-align:left;">

religion

</td>

<td style="text-align:left;">

food

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

parenting

</td>

<td style="text-align:left;">

967

</td>

</tr>

<tr>

<td style="text-align:left;">

PCluster 2

</td>

<td style="text-align:left;">

cooking

</td>

<td style="text-align:left;">

photo\_sharing

</td>

<td style="text-align:left;">

fashion

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

beauty

</td>

<td style="text-align:left;">

734

</td>

</tr>

<tr>

<td style="text-align:left;">

PCluster 3

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

tv\_film

</td>

<td style="text-align:left;">

college\_uni

</td>

<td style="text-align:left;">

current\_events

</td>

<td style="text-align:left;">

music

</td>

<td style="text-align:left;">

603

</td>

</tr>

<tr>

<td style="text-align:left;">

PCluster 4

</td>

<td style="text-align:left;">

news

</td>

<td style="text-align:left;">

politics

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

automotive

</td>

<td style="text-align:left;">

sports\_fandom

</td>

<td style="text-align:left;">

582

</td>

</tr>

<tr>

<td style="text-align:left;">

PCluster 5

</td>

<td style="text-align:left;">

politics

</td>

<td style="text-align:left;">

travel

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

computers

</td>

<td style="text-align:left;">

news

</td>

<td style="text-align:left;">

553

</td>

</tr>

<tr>

<td style="text-align:left;">

PCluster 6

</td>

<td style="text-align:left;">

college\_uni

</td>

<td style="text-align:left;">

online\_gaming

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

photo\_sharing

</td>

<td style="text-align:left;">

sports\_playing

</td>

<td style="text-align:left;">

507

</td>

</tr>

<tr>

<td style="text-align:left;">

PCluster 7

</td>

<td style="text-align:left;">

art

</td>

<td style="text-align:left;">

tv\_film

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

current\_events

</td>

<td style="text-align:left;">

travel

</td>

<td style="text-align:left;">

346

</td>

</tr>

<tr>

<td style="text-align:left;">

PCluster 8

</td>

<td style="text-align:left;">

dating

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

photo\_sharing

</td>

<td style="text-align:left;">

fashion

</td>

<td style="text-align:left;">

school

</td>

<td style="text-align:left;">

275

</td>

</tr>

<tr>

<td style="text-align:left;">

PCluster 9

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

photo\_sharing

</td>

<td style="text-align:left;">

shopping

</td>

<td style="text-align:left;">

current\_events

</td>

<td style="text-align:left;">

travel

</td>

<td style="text-align:left;">

1564

</td>

</tr>

<tr>

<td style="text-align:left;">

PCluster 10

</td>

<td style="text-align:left;">

health\_nutrition

</td>

<td style="text-align:left;">

personal\_fitness

</td>

<td style="text-align:left;">

chatter

</td>

<td style="text-align:left;">

cooking

</td>

<td style="text-align:left;">

outdoors

</td>

<td style="text-align:left;">

1178

</td>

</tr>

</tbody>

</table>

## Can We Have More Accurate, Unique or Complete Labels?

The first problem of the result in Table 4.3 also exists in Table 4.2
and Table 4.4, though in a much less evident way: 27 categories out of
34 categories are used to differentiate consumers into 10 clusters.
Probably it is because the rest 7 categories are not discernable or
important enough based on the data, but it could be the possibility that
our method was not refined enough. Of course, we could pick out more
categories, say, first six or seven categories with high sums of
frequencies, from each cluster, to include categories as many as
possible. However, usually the categories below the third one only have
relatively much smaller sums of frequencies than those of the first
three categories. So, including more categories would be likely to put
more infrequent or accident tweets into the description of distinct
preferences. Moreover, some clusters may be not so distinguishable from
other clusters. For example, Cluster 4 and 5, as well as Cluster 3 and
6, are more likely to consist of the same group of people. The borders
between those clusters are not so clear. Therefore, in this part, for
each of 10 clusters, we tried to find out the unique category or the
combination of several unique categories dominating all other categories
by the sum of frequencies. Meanwhile, all those unique category or
combinations of unique categories made up a partition of 34 categories.
By doing so, we were attaching labels to each cluster to make them more
distinguishable.

The approach we applied was Hierarchical Clustering with K-means. The
Hierarchical Clustering was to find out a hierarchical structure of
categories based on the proximity matrix of correlations between each
pair of categories. Figure 4.3 shows the dendrogram.

![](Exercise3_files/figure-gfm/setup%204.7-1.png)<!-- -->

Then, we horizontally cut the dendrogram into ten clusters of categories
as a partition of 34 categories. Based on the partition, we added up the
categories belonging to the same cluster in the frequency dataset, to
get a new dataset with 7309 observations and 10 clusters. Then we used
K-means to split consumers into 10 clusters of consumers and applied the
same procedure as in K-means to attach ten clusters of categories to ten
clusters of consumers. The result is shown in Table 4.5 (Again, to
bedistinguishable, we named clusters as “Hcluster” here).

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

**Table 4.5: Result of Hierarachical Clustering with K-means**

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:left;">

Consumers.No.

</th>

<th style="text-align:left;">

Core\_Categories

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Hcluster 1

</td>

<td style="text-align:left;">

913

</td>

<td style="text-align:left;">

sports\_fandom, food, family, religion, parenting, school

</td>

</tr>

<tr>

<td style="text-align:left;">

Hcluster 2

</td>

<td style="text-align:left;">

740

</td>

<td style="text-align:left;">

eco, current\_events, uncategorized, home\_and\_garden, music, business,
small\_business

</td>

</tr>

<tr>

<td style="text-align:left;">

Hcluster 3

</td>

<td style="text-align:left;">

718

</td>

<td style="text-align:left;">

cooking, beauty, fashion

</td>

</tr>

<tr>

<td style="text-align:left;">

Hcluster 4

</td>

<td style="text-align:left;">

558

</td>

<td style="text-align:left;">

news, automotive

</td>

</tr>

<tr>

<td style="text-align:left;">

Hcluster 5

</td>

<td style="text-align:left;">

521

</td>

<td style="text-align:left;">

online\_gaming, college\_uni, sports\_playing

</td>

</tr>

<tr>

<td style="text-align:left;">

Hcluster 6

</td>

<td style="text-align:left;">

516

</td>

<td style="text-align:left;">

travel, politics, computers

</td>

</tr>

<tr>

<td style="text-align:left;">

Hcluster 7

</td>

<td style="text-align:left;">

457

</td>

<td style="text-align:left;">

tv\_film, crafts, art

</td>

</tr>

<tr>

<td style="text-align:left;">

Hcluster 8

</td>

<td style="text-align:left;">

297

</td>

<td style="text-align:left;">

dating

</td>

</tr>

<tr>

<td style="text-align:left;">

Hcluster 9

</td>

<td style="text-align:left;">

1412

</td>

<td style="text-align:left;">

chatter, photo\_sharing, shopping

</td>

</tr>

<tr>

<td style="text-align:left;">

Hcluster 10

</td>

<td style="text-align:left;">

1177

</td>

<td style="text-align:left;">

health\_nutrition, outdoors, personal\_fitness

</td>

</tr>

</tbody>

</table>

One good news is that there exists one to one mapping between ten
clusters of categories and ten clusters of consumers. The other good
news is that the distribution of the numbers of consumers over ten
clusters is extremely close to the distribution in Table 4.3 or Table
4.4. Hence, by comparing the number of consumers, it is straightforward
to link the clusters in Table 4.5 to those clusters in Table 4.3 or
Table 4.4. The stable clustering structures across different approaches
proves that our ten clusters are very robust based on our data.

It should be noted that the labels in Table 4.5 are supplements to
categories of each cluster in Table 4.3 or Table 4.4. By labels in Table
4.5, the brand can try to do more accurate advertising or marketing for
consumers in any clusters. It also helps the brand to recognize a new
consumer. For example, if a new consumer has some crafts posts, just by
categories in Table 4.3 or 4.4, it is difficulty to put her into any
cluster. But by labels in Table 4.5, we know crafts is more likely to be
clustered with movie and art, so it is reasonable to put her in Cluster
7 before having more information about this new consumer.

## Conclusion

Based on the above ten clusters of consumers, now we can make some
comments.

The largest cluster of the audience of NurientH20 was those who focused
much on health and workout. The second largest paid more attention to
online socializing and shopping. The third to fifth largest clusters
focused more on daily activities and business. All those largest five
clusters probably could be grouped into a more general consumer type:
less likely to be students, perhaps having families and children, caring
about health and gym, possessing common hobbits like sports, fashion,
and beauty. Also, they were more likely to have incomes. Therefore, this
type of consumers could be in priority in the marketing of NutrientH20.

The second type of consumers might be younger people. Most of them
probably were college students with those classical student preferences
like online gaming, sporting, watching movies and TV shows, dating and
so forth. This type of consumers might have minor purchase power, but
they could be potential future consumers of the brand, with more
permanent brand loyalty. Hence, it was also important for NutrientH20 to
attract those type of consumers as many as possible.
