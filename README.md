# Consumer-Electronics-Principal-Component-Analysis-

## Background

I analyze consumer brand perception survey data for popular consumer electronic device brands. 

![image](https://github.com/apoorvadudani/Principal-Component-Analysis-/assets/113878059/215345cc-df5e-47ed-8423-bfb314b72121)

This data reflects consumer ratings of brands with regard to perceptual adjectives as expressed on survey items with the following form:

On a scale from 1 to 10—where 1 is least and 10 is most—how [ADJECTIVE] is [BRAND A]?

In this dataset, an observation is one respondent’s rating of a brand on one of the adjectives. Two such items might be:
1. How trendy is Sony?
2. How much of a category leader is Bose?

Such ratings are collected for all the combinations of adjectives and brands of interest.

The data here comprise simulated ratings of 10 brands on 9 adjectives (“performance,” “leader,” “latest,” “fun,” and so forth), for N = 100 simulated respondents. 

<img width="553" alt="Screenshot 2024-03-06 at 7 50 50 PM" src="https://github.com/apoorvadudani/Principal-Component-Analysis-/assets/113878059/e054863f-59cd-4e7f-9f81-c232a3adc3bf">

## Rescaling and Clustering the Data

I take our initial data and make some adjustments to the first 9 columns to standardize them to a common measure (z-scoring). This is making sure all parts of the data are using the same scale. Then, I use the corrplot package and library to visualize how closely related each pair of variables (like questions in a survey about brand attributes) are to each other. The strength of the relationship between two variables is shown by how close together or far apart they are on the map. Hierarchical clustering orders the variables in the correlation plot, and sorts the variables in such a way that variables with similar patterns of correlation are grouped together in clusters in the plot, as below:

![image](https://github.com/apoorvadudani/Principal-Component-Analysis-/assets/113878059/8f30f3ed-3790-4de3-8606-67fe840daea5)

The plot suggests the following:

- Certain brand attributes are closely related and form clusters. For example, attributes like "fun," "trendy," and "latest" might be one cluster, indicating that brands perceived as fun also tend to be seen as trendy and up-to-date.

- The size and color of the circles indicate the strength and direction of the relationship between pairs of attributes. Large, dark blue circles represent strong positive correlations, meaning as one attribute increases, the other tends to increase as well. Conversely, large, dark red circles represent strong negative correlations, where an increase in one attribute corresponds to a decrease in the other.

- Smaller circles or those closer to white suggest little to no correlation between those attributes, indicating that they are perceived independently of one another.

## Aggregate Mean Ratings by Brand

What is the average (mean) position of the brand on each adjective? To answer this, I first gather all data for each brand and calculate the average. Using our tools to paint a heatmap, which shows how similar or different brands compare on various attributes. Some brands are strongly associated with certain attributes. For example, dark blue indicates a strong positive association, and a brand with dark blue in "perform" is seen as high performing.

![image](https://github.com/apoorvadudani/Principal-Component-Analysis-/assets/113878059/466afb86-a4b4-4195-ae99-ca81906ed635)

For each brand, these are the perceptions:

- Sony - known for high performance and serious technology.
- LG - also stands for reliable performance and innovation.
- Bose - a leader in audio with a serious approach to sound quality.
- Canon - a trusted brand for photographic equipment, valuing performance.
- Apple - often seen as a leader, innovative, and trendy.
- Hewlett-Packard (HP) - a long-standing brand known for value and performance in computing.
- Dell - a serious and value-oriented brand in computing technology.
- Epson - known for reliable performance in printing technology.
- Asus - balances performance with value, also trendy in the gaming community.
- JBL - provides fun and trendy audio products with good performance.

Sony and LG have high ratings for "rebuy" and "value" but score low on "latest" and "fun". This could indicate that while customers are loyal and see value in these brands, they may not view them as the most cutting-edge or entertaining compared to others. This could suggest a strategy focused on highlighting new innovations and features in their latest products to shift consumer perception towards seeing Sony and LG as more contemporary and exciting brands.

Bose and Canon share similarities in certain attributes. They could possibly be perceived well in terms of quality or reliability but might need to work on other aspects such as being viewed as budget-friendly or innovative.

Apple, HP and Dell are typically strong brands, often perceived as leaders in innovation and quality. Grouped together, it suggests they share a strong market perception across several attributes. They should continue to leverage their strengths in marketing strategies.

Asus and JBL are paired for attributes like "fun" and "bargain", which might imply that consumers see these brands as offering enjoyable products at a good price point. This pairing could suggest a strategy focused on marketing products that bring enjoyment to consumers at a competitive price.

## Principal Component Analysis

Scatterplot of correlated data with discrete values:

![image](https://github.com/apoorvadudani/Principal-Component-Analysis-/assets/113878059/7ae5076a-5fbe-4fcf-9d52-52a64a982265)

A biplot() of a principal component analysis solution for the simple, constructed example, showing data points plotted on the first two components:

![image](https://github.com/apoorvadudani/Principal-Component-Analysis-/assets/113878059/8269c38e-0427-478b-ac12-61f95bed7494)


## Perceptual map



![image](https://github.com/apoorvadudani/Principal-Component-Analysis-/assets/113878059/dec52a90-f12f-4e6f-b27c-3590c3ea097b)
