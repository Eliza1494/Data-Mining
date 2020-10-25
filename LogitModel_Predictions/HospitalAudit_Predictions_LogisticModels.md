
# Problem 2: A hospital audit

In problem 2, we examine the performance of the radiologists by
answering two questions. The first question has the goal to observe how
clinically conservative each radiologist is in recalling patients. The
second question intends to answer whether radiologists weigh less
importance on some risk factor that should actually be considered more
rigorously when making a recall decision.

## Question 1: Are some radiologists more clinically conservative than others in recalling patients, holding patient risk factors equal?

First, we compare the performance of three logistic models shown below,
that regress recall on different risk factors. We use out-of-sample
accuracy rates and out-of-sample error rates as model performance
measures. By evaluating the accuracy rate, we examine how accurate our
model is in making predictions. We also compute error rate, which is the
opposite of a model’s accuracy, to examine the rate of misfits.

**Model 1** Recall<sub>β</sub> = β<sub>1</sub> age + β<sub>2</sub>
history + β<sub>3</sub> symptoms + β<sub>4</sub> menopause +
β<sub>5</sub> density + β<sub>6</sub> radiologist + β<sub>7</sub>
radiologist\* age + β<sub>8</sub> radiologist\* history + β<sub>9</sub>
radiologist\* symptoms + β<sub>10</sub> radiologist\* menopause +
β<sub>11</sub> radiologist\*density

**Model 2:** Recall<sub>β</sub> = β<sub>1</sub> age + β<sub>2</sub>
history + β<sub>3</sub> symptoms + β<sub>4</sub> menopause +
β<sub>5</sub> density + β<sub>6</sub> radiologist

**Model 3:** Recall<sub>β</sub> = β<sub>1</sub> age + β<sub>2</sub>
symptoms + β<sub>3</sub> age \* symptoms + β<sub>4</sub> history +
β<sub>5</sub> menopause + β<sub>6</sub> density + β<sub>7</sub>
radiologist We performed 100 simulations on each model and computed the
average out-of-sample accuracy rate and the average out-of-sample error
rate for each of the three models. Based on these performance rates, we
decided which model to use to predict the probabilities of recall for
each radiologist. All three models have high out of sample performance;
however, models 2 and 3 have higher out of sample accuracy rates and
lower error rates on average than model 1.

Table 2.1 displays the average out of sample accuracy rates and error
rates for each of the three models.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

**Table 2.1 Average Model Performance Rates**

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:right;">

Mean

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Accuracy Rate of Model 1

</td>

<td style="text-align:right;">

0.8388

</td>

</tr>

<tr>

<td style="text-align:left;">

Accuracy Rate of Model 2

</td>

<td style="text-align:right;">

0.8510

</td>

</tr>

<tr>

<td style="text-align:left;">

Accuracy Rate of Model 3

</td>

<td style="text-align:right;">

0.8512

</td>

</tr>

<tr>

<td style="text-align:left;">

Error Rate of Model 1

</td>

<td style="text-align:right;">

0.1617

</td>

</tr>

<tr>

<td style="text-align:left;">

Error Rate of Model 2

</td>

<td style="text-align:right;">

0.1494

</td>

</tr>

<tr>

<td style="text-align:left;">

Error Rate of Model 3

</td>

<td style="text-align:right;">

0.1492

</td>

</tr>

</tbody>

</table>

We use two indicators to determine which radiologists are more
clinically conservative and which are less. The first approach is to
examine the radiologists’ coefficients, computing odds, and compare them
while holding all risk factors constant. The second approach is to
compare their overall predicted probabilities of recalling a patient.

We decided to use model 2 to run a logistic regression and compare the
coefficients of each radiologist variable. The coefficient of
radiologist 89 is the highest. Therefore, given that radiologist 89 is
making the recall decision, the odds of a recall is multiplied by
exp(0.46) \~ 1.59, compared to radiologist 13, holding all risk factors
constant. Hence, out of all five radiologists, 89 is the most clinically
conservative in recalling patients. On the other hand, radiologist 34
has the lowest coefficient, so if this radiologist is making the recall
decision, the odds of a recall are multiplied by exp(-0.52) \~ 0.59,
compared to radiologist 13, holding all other variables constant.
Therefore, radiologist 34 is the least clinically conservative in
recalling patients and he has the highest threshold for wanting to
double check the patient’s results.

Table 2.2 shows the coefficients resulting from the regression model 2.

<table style="border-collapse:collapse; border:none;">

<caption style="font-weight: bold; text-align:left;">

**Table 2.2 Coefficients of Model 2**

</caption>

<tr>

<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">

 

</th>

<th colspan="2" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">

Model 2

</th>

</tr>

<tr>

<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">

Predictors

</td>

<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">

Coefficients

</td>

<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">

p

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

(Intercept)

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-3.28

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age \[age5059\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.11

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.707

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age \[age6069\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.16

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.665

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age \[age70plus\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.11

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.770

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

history

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.22

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.354

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

symptoms

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.73

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.042</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

menopause \[postmenoNoHT\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.19

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.415

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

menopause<br>\[postmenounknown\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.40

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.385

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

menopause \[premeno\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.34

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.274

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

density \[density2\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.22

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.024</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

density \[density3\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.42

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.008</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

density \[density4\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.097

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

radiologist<br>\[radiologist34\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.52

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.111

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

radiologist<br>\[radiologist66\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.35

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.204

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

radiologist<br>\[radiologist89\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.46

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.098

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

radiologist<br>\[radiologist95\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.05

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.859

</td>

</tr>

</table>

Table 2.3 displays the odds ratios, confidence intervals and p-values
estimated from regressing model 2. Considering the fact that radiologist
13 is the base for the logistic model, radiologist 89 and 66 both
increase the odds of recall compared to radiologist 13, while
radiologists 95 and 34 both decrease the odds of recall compared to
radiologist 13. Hence, observing the odds ratios of each radiologist,
the ranking of radiologists from most clinically conservative to least
clinically conservative is as follows: radiologist 89, radiologist 66,
radiologist 13, radiologist 95, radiologist 34.

<table style="border-collapse:collapse; border:none;">

<caption style="font-weight: bold; text-align:left;">

**Table 2.3 Odds Ratios of Model 2**

</caption>

<tr>

<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">

 

</th>

<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">

recall

</th>

</tr>

<tr>

<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">

Predictors

</td>

<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">

Odds Ratios

</td>

<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">

CI

</td>

<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">

p

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

(Intercept)

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.04

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.01 – 0.13

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>\<0.001

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age \[age5059\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.12

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.63 – 1.99

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.707

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age \[age6069\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.17

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.58 – 2.38

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.665

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age \[age70plus\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.11

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.54 – 2.30

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.770

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

history

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.24

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.79 – 1.96

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.354

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

symptoms

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

2.07

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.03 – 4.19

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.042</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

menopause \[postmenoNoHT\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.82

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.52 – 1.31

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.415

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

menopause<br>\[postmenounknown\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.50

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.60 – 3.71

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.385

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

menopause \[premeno\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.41

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.76 – 2.60

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.274

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

density \[density2\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

3.39

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.18 – 9.74

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.024</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

density \[density3\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

4.13

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.45 – 11.81

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

<strong>0.008</strong>

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

density \[density4\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

2.72

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.84 – 8.85

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.097

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

radiologist<br>\[radiologist34\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.59

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.31 – 1.13

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.111

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

radiologist<br>\[radiologist66\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.43

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.83 – 2.46

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.204

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

radiologist<br>\[radiologist89\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.59

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.92 – 2.75

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.098

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

radiologist<br>\[radiologist95\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.95

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.53 – 1.69

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.859

</td>

</tr>

</table>

To address the problem that radiologists do not see the same patients we
used a counterfactual approach. We applied model 2 to compute the
predicted probabilities for each radiologist. For a test set, we used
the whole data set but for each prediction we transformed the first
column to include only one radiologist per test set. In this way, each
radiologist’s average predicted probability was calculated using the
same patients. To examine how conservative each radiologist is, we
compared their average predicted probabilities.

Table 2.4 shows the average predicted probability of recalling a patient
for each radiologist.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

**Table 2.4 Average Probability per Radiologist**

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:right;">

Average Probability

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Radiologist 13

</td>

<td style="text-align:right;">

0.1454590

</td>

</tr>

<tr>

<td style="text-align:left;">

Radiologist 34

</td>

<td style="text-align:right;">

0.0865001

</td>

</tr>

<tr>

<td style="text-align:left;">

Radiologist 66

</td>

<td style="text-align:right;">

0.1803966

</td>

</tr>

<tr>

<td style="text-align:left;">

Radiologist 89

</td>

<td style="text-align:right;">

0.2007607

</td>

</tr>

<tr>

<td style="text-align:left;">

Radiologist 95

</td>

<td style="text-align:right;">

0.1345273

</td>

</tr>

</tbody>

</table>

As revealed from Table 2.4, radiologist 89 can be regarded as the most
clinically conservative out of all radiologists, very closely followed
by 66, since both their average predicted probabilities are the highest.
On the other hand, radiologist 34 is the least conservative with the
lowest average predicted probability, giving risk factors constant.
Therefore, if we compare radiologist 89 to radiologist 34, we can state
that radiologist 89 has a lower threshold for wanting to double-check
the patient’s results compared to radiologist 34. These results confirm
the conclusion from our first approach where we compared coefficients
and odds.

To confirm the results above, we also computed false negative rates and
false positive rates for each radiologist. If a radiologist has the
lowest false negative, then he or she is more likely to recall the
patients who have cancer so they can be treated as early as possible. On
the other hand, if a radiologist has the lowest false positive rate then
he or she is more likely to recall the patients who do not have cancer
so they are not disturbed for no reason.

Below we list the confusion matrices for each radiologist.

<table class="table" style="width: auto !important; float: left; margin-right: 10px;">

<caption>

**Confusion Matrix: Radiologist 13**

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:center;">

recall = 0

</th>

<th style="text-align:center;">

recall = 1

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

cancer = 0

</td>

<td style="text-align:center;">

165

</td>

<td style="text-align:center;">

25

</td>

</tr>

<tr>

<td style="text-align:left;">

cancer = 1

</td>

<td style="text-align:center;">

4

</td>

<td style="text-align:center;">

4

</td>

</tr>

</tbody>

</table>

<table class="table" style="width: auto !important; margin-right: 0; margin-left: auto">

<caption>

**Confusion Matrix: Radiologist 34**

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:center;">

recall = 0

</th>

<th style="text-align:center;">

recall = 1

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

cancer = 0

</td>

<td style="text-align:center;">

177

</td>

<td style="text-align:center;">

13

</td>

</tr>

<tr>

<td style="text-align:left;">

cancer = 1

</td>

<td style="text-align:center;">

3

</td>

<td style="text-align:center;">

4

</td>

</tr>

</tbody>

</table>

<table class="table" style="width: auto !important; float: left; margin-right: 10px;">

<caption>

**Confusion Matrix: Radiologist 66**

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:center;">

recall = 0

</th>

<th style="text-align:center;">

recall = 1

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

cancer = 0

</td>

<td style="text-align:center;">

157

</td>

<td style="text-align:center;">

33

</td>

</tr>

<tr>

<td style="text-align:left;">

cancer = 1

</td>

<td style="text-align:center;">

4

</td>

<td style="text-align:center;">

4

</td>

</tr>

</tbody>

</table>

<table class="table" style="width: auto !important; margin-right: 0; margin-left: auto">

<caption>

**Confusion Matrix: Radiologist 89**

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:center;">

recall = 0

</th>

<th style="text-align:center;">

recall = 1

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

cancer = 0

</td>

<td style="text-align:center;">

157

</td>

<td style="text-align:center;">

33

</td>

</tr>

<tr>

<td style="text-align:left;">

cancer = 1

</td>

<td style="text-align:center;">

2

</td>

<td style="text-align:center;">

5

</td>

</tr>

</tbody>

</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

**Confusion Matrix: Radiologist 95**

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:center;">

recall = 0

</th>

<th style="text-align:center;">

recall = 1

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

cancer = 0

</td>

<td style="text-align:center;">

168

</td>

<td style="text-align:center;">

22

</td>

</tr>

<tr>

<td style="text-align:left;">

cancer = 1

</td>

<td style="text-align:center;">

2

</td>

<td style="text-align:center;">

5

</td>

</tr>

</tbody>

</table>

1.  For radiologist 13, False Negative is 4/(4+8) = 0.5, False Positive
    is 25/(165+25) = 0.13.

2.  For radiologist 34, False Negative is 3/(3+4) = 0.43, False Positive
    is 13/(177+33) = 0.068.

3.  For radiologist 66, False Negative is 4/(4+4) = 0.5, False Positive
    is 33/(157+33) = 0.1737.

4.  For radiologist 89, False Negative is 2/(2+5) = 0.2857, False
    Positive is 33/(157+33) = 0.1737.

5.  For radiologist 95, False Negative is 2/(2+5) = 0.2857, False
    Positive is 22/(168+22) = 0.1158.

The false positive rates support the prediction probability of results
made by both models. We stated that the most clinically conservative
radiologist seems to be radiologist 89 and the second most clinically
conservative - radiologist 66. The false positive rates for both
radiologists confirm these results since their rates are the highest.
Both radiologists 89 and 66 have wrongly recalled patients most
frequently because these radiologists are the two most conservative.
Radiologist 34 has the smallest false positive rate since he/she can be
considered as the radiologist who is most likely to not recall patients
who do not end up having cancer. This result also supports the fact that
radiologist 34 is the least conservative. As for the False Negative
results, the radiologists that are most likely to recall the patients
that do end up having cancer are radiologists 89 and 95 because they
have the lowest false negatives rates.

## Question 2: Does the data suggest that radiologists should be weighing some clinical risk factors more heavily than they currently are?

For question 2, we have decided to use two ways to evaluate what cancer
risk factors radiologists weigh more heavily. First, we approach the
problem through comparison of deviances to measure the performance of
the model in terms of the predicted probabilities. Second, we examine
the coefficients of each risk factor separately to conclude if
radiologists are putting enough weight on these factors when making a
recall decision.

In the first approach, where we compute deviances, we are not using
confusion matrices and related error rates. The reason is that error
rates are looking at decisions of class labels as opposed to how
well-calibrated predicted probabilities are to the actual outcomes. In
making decisions, both costs and probabilities matter, as different
kinds of errors may have different costs, especially if we are
considering the costs related to cancer outcomes. Thus, we want to
evaluate the probability of prediction models independently of the
decisions that it makes about the class label.

By calculating the likelihood of each model’s predicted probabilities
and then finding the deviance, we conclude whether radiologists should
be weighting some clinical factors more heavily than they currently are.
The decisions are based on the magnitude of the average deviance of each
model. If a model has a smaller average deviance, it is performing
better than a one with higher average deviance. Hence, the model with
better(smaller) deviance accounts for some factor(s) that have not been
accounted for in the model with higher deviance.

We compared the following logistic models that regress cancer on risk
factors. Model 1 is the baseline model that we compare all other models
with:

**Model 1:** Cancer<sub>β</sub> = β<sub>1</sub> recall

**Model 2:** Cancer<sub>β</sub> = β<sub>1</sub> recall + β<sub>2</sub>
menopause

**Model 3:** Cancer<sub>β</sub> = β<sub>1</sub> recall + β<sub>2</sub>
density

**Model 4:** Cancer<sub>β</sub> = β<sub>1</sub> recall + β<sub>2</sub>
history

**Model 5:** Cancer<sub>β</sub> = β<sub>1</sub> recall + β<sub>2</sub>
symptoms

**Model 6:** Cancer<sub>β</sub> = β<sub>1</sub> recall + β<sub>2</sub>
age

**Model 7:** Cancer<sub>β</sub> = β<sub>1</sub> recall + β<sub>2</sub>
density + β<sub>2</sub> symptoms

**Model 8:** Cancer<sub>β</sub> = β<sub>1</sub> recall + β<sub>2</sub>
density + β<sub>2</sub> symptoms + β<sub>2</sub> menopause

We simulated 100 regressions for each model, calculated the deviances
for each model and then took average of these deviances to come up with
an average deviance per model. The reason why we have included models 7
and 8 is because density, symptoms and menopause have the lowest average
deviances compared to all other models except the baseline model, model
1 . Hence, we wanted to observe if the average deviances of models 7 and
8 will be lower than that of the baseline model.

Table 2.5 reveals the average deviance of each of the 10 models.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">

<caption>

**Table 2.5 Average Deviance per Model**

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:right;">

Average Deviance

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Deviance: Baseline

</td>

<td style="text-align:right;">

29.53941

</td>

</tr>

<tr>

<td style="text-align:left;">

Deviance: Menopause

</td>

<td style="text-align:right;">

30.08505

</td>

</tr>

<tr>

<td style="text-align:left;">

Deviance: Density

</td>

<td style="text-align:right;">

31.98177

</td>

</tr>

<tr>

<td style="text-align:left;">

Deviance: History

</td>

<td style="text-align:right;">

29.82153

</td>

</tr>

<tr>

<td style="text-align:left;">

Deviance: Symptoms

</td>

<td style="text-align:right;">

30.80609

</td>

</tr>

<tr>

<td style="text-align:left;">

Deviance: Age

</td>

<td style="text-align:right;">

29.69642

</td>

</tr>

<tr>

<td style="text-align:left;">

Deviance: Density\&Symptoms

</td>

<td style="text-align:right;">

33.26026

</td>

</tr>

<tr>

<td style="text-align:left;">

Deviance: Density, Symptoms & Menopause

</td>

<td style="text-align:right;">

33.72041

</td>

</tr>

</tbody>

</table>

We consider the first model, where we are regressing cancer on recall,
as the baseline model. If the radiologists have been weighing risk
factors flawlessly, the baseline model would have the lowest deviance,
as they take into account all the risk factors when making decisions to
recall the patients. By comparing the baseline model with all the models
that have only one more variable added to the recall variable (models 2,
3, 4, 5, 6), we find that the lowest average deviance has model 1, the
baseline model, as shown in Table 2.5. This result indicates that
radiologists are considering strongly enough all the risk factors when
making a recall decision.

Lastly, in the second approach, we compare the coefficients of models 2,
3, 4, 5, and 6 to see if they are high enough. If a coefficient has a
significant effect on the odds of having a cancer, then the radiologist
may not be considering that risk factor as strongly in making his or her
recall decision. The following table shows the coefficients of each of
the models that consist of one other variable except the recall.

<table style="border-collapse:collapse; border:none;">

<caption style="font-weight: bold; text-align:left;">

**Table 2.6 Coefficients of Models**

</caption>

<tr>

<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">

 

</th>

<th colspan="1" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">

Model 1

</th>

<th colspan="1" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">

Model 2

</th>

<th colspan="1" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">

Model 3

</th>

<th colspan="1" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">

Model 4

</th>

<th colspan="1" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">

Model 5

</th>

<th colspan="1" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">

Model 6

</th>

</tr>

<tr>

<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">

Predictors

</td>

<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">

Coefficients

</td>

<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">

Coefficients

</td>

<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">

Coefficients

</td>

<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">

Coefficients

</td>

<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">

Coefficients

</td>

<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  col7">

Coefficients

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

(Intercept)

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-4.01

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-4.00

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-4.79

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-4.04

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-4.02

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">

\-4.32

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

recall

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

2.26

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

2.26

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

2.26

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

2.26

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

2.25

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">

2.33

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

menopause \[postmenoNoHT\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.02

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

menopause<br>\[postmenounknown\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.77

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

menopause \[premeno\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.17

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

density \[density2\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.67

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

density \[density3\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.67

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

density \[density4\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.62

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

history

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.21

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

symptoms

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.26

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age \[age5059\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">

0.19

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age \[age6069\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">

\-0.12

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age \[age70plus\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">

0.92

</td>

</tr>

</table>

As seen from the table above, the highest coefficients are for density,
age and menopause. Looking at model 3, the patients with a risk factor
of density \[4\] (extremely danse) have exp(1.62) \~ 5.05 times the odds
of having cancer as patients with density 1, even holding recall status
constant. Hence, we can conclude that radiologists may not be weighting
as much importance to density (or more accurately, density \[4\]) as
they should be when interpreting the mammogram and deciding whether to
recall the patient. Considering models 6 and 2, patients older than 70
have exp(0.92) \~ 2.51 times the odds of having cancer as patients
younger than 50, holding recall status constant. Also, if the patient
has been observed to have a postmenounknown menopause risk factor, then
she has exp(0.77) \~ 2.51 times the odds of having cancer compared to a
patient with post menopause $HT, holding recall constant. All 3 of these
coefficients significantly influence the odds of having a cancer,
especially the density \[4\] coefficient. Therefore, radiologists should
be suggested to weigh density, age, and menopause (or more accurately,
density \[4\], age above 70, and unknown menopause) more heavily than
they currently are.

Regressing cancer on these 3 variables: density, age and menopause
together, increases the coefficients for density and age even more as
revealed in the table below. The table 2.7 displays the coefficients of
the logistic model 7.

**Model 7:** Cancer<sub>β</sub> = β<sub>1</sub> recall + β<sub>2</sub>
density + β<sub>2</sub> age + β<sub>2</sub> menopause

<table style="border-collapse:collapse; border:none;">

<caption style="font-weight: bold; text-align:left;">

**Table 2.7 Coefficients of Model 7**

</caption>

<tr>

<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">

 

</th>

<th colspan="1" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">

Model 7

</th>

</tr>

<tr>

<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">

Predictors

</td>

<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">

Coefficients

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

(Intercept)

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-5.58

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

recall

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

2.30

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

density \[density2\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.74

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

density \[density3\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.87

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

density \[density4\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.97

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age \[age5059\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.44

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age \[age6069\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.39

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

age \[age70plus\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

1.40

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

menopause \[postmenoNoHT\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

\-0.17

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

menopause<br>\[postmenounknown\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.77

</td>

</tr>

<tr>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">

menopause \[premeno\]

</td>

<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">

0.18

</td>

</tr>

</table>

The two approaches lead us to slightly different conclusions. First, the
comparison of each model’s average deviance revealed that the baseline
model (cancer regressed only on recall) has the lowest deviance on
average; hence, radiologists are already weighing sufficient importance
on all risk factors. However, the comparison of each risk factor’s
coefficient showed us that radiologist should actually weigh density,
age and menopause stronger than they currently are in making recall
decisions.

Since the deviance measure can be considered more unstable than
examining the coefficients, we will lean on the results from approach 2
and conclude that radiologists should be placing more importance on
density, age and menopause when making a recall decision.
