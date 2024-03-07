# Positioning-Popular-Consumer-Electronics-Brands-Using-Principal-Component-Analysis

## Background

I analyze consumer brand perception survey data for popular consumer electronic device brands. 

![image](https://github.com/apoorvadudani/Principal-Component-Analysis-/assets/113878059/215345cc-df5e-47ed-8423-bfb314b72121)

This data reflects consumer ratings of brands with regard to perceptual adjectives as expressed on survey items with the following form:

On a scale from 1 to 10—where 1 is least and 10 is most—how [ADJECTIVE] is [BRAND A]?

In this dataset, an observation is one respondent’s rating of a brand on one of the adjectives. Two such items might be:
1. How trendy is Sony?
2. How much of a category leader is Bose?

Such ratings are collected for all the combinations of adjectives and brands of interest.

The multidimensional data here comprise simulated ratings of 10 brands on 9 adjectives (“performance,” “leader,” “latest,” “fun,” and so forth), for N = 100 simulated respondents. 

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

## Principal Component Analysis (PCA)

PCA helps make things simpler by finding out which parts of your data tell you the most about the whole set without having to look at every little piece. When you compare several brands across many dimensions, it can be helpful to focus on just the first two or three principal components that explain variation in the data. I find the components with the PCA function prcomp().

I can select how many components out of the 9 to focus on using a scree plot, which shows how much variation in the data is explained by each principal component. A scree plot is often interpreted as indicating where additional components are not worth the complexity; this occurs where the line has an elbow, a kink in the angle of bending where the graph stops dropping off sharply and starts to flatten out. This is a somewhat subjective determination, and in this case we consider it to be around the second or third component:

![image](https://github.com/apoorvadudani/Principal-Component-Analysis-/assets/113878059/bf768579-c4d7-4b48-aef7-9474e4ff7269)

## Findings

A biplot of the PCA solution for the mean ratings gives an interpretable correspondence map, showing where the brands are placed with respect to the first two principal components:

![image](https://github.com/apoorvadudani/Principal-Component-Analysis-/assets/113878059/dec52a90-f12f-4e6f-b27c-3590c3ea097b)

The actual names or the specific meanings of PC1 and PC2 are not directly provided in the biplot and these components are new super-attributes that are created by combining the original attributes in specific ways. They are mathematical constructs that capture certain variances and are defined by their loadings on the original variables (the brand attributes). The 'loadings' are the correlations or connections each original variable (like "fun," "perform," etc.) has with a given component. They tell us how much a change in the original variable would move the component. A high loading means that attribute strongly influences the PC, while a low loading means it has less influence.

- PC1 (Horizontal Axis): This principal component captures the largest variance in the dataset. This dimension likely captures perceptions related to price, value, or affordability. Brands on the left like LG and Sony are associated with "value" and "bargain", while premium brands like Bose, Canon, and Apple are on the right side.

- PC2 (Vertical Axis): The second principal component often captures variance not accounted for by the first. This dimension seems to represent perceptions around innovation, trendiness, or performance quality. Brands higher up like Bose, Canon, and Apple are labeled as "serious/leader", "trendy", and "latest", suggesting high-performance or cutting-edge attributes. Lower brands like JBL and Asus are aligned with "fun", potentially implying a focus on excitement, customer experience, entertainment or casual use cases.

This information matters because it simplifies complex data into a few key 'themes'. Instead of juggling dozens of individual attributes, you can concentrate on a few big-picture components. It makes analysis and decision-making more focused and manageable.

Dell and Epson are positioned near the center, suggesting a more neutral or mainstream perception.

## Recommendations

Epson's goal to be a safe brand that appeals to many consumers meant that its relatively undifferentiated position was desirable sp far. However, the new CMO wishes the brand to have a strong, differentiated space where no brand is positioned. In the correspondence map, there is a large gap between the group Sony/LG on the bottom of the chart, versus Bose/Canon on the upper left. This area might be described as the “value leader” area or similar.

How do we find out how to position there? Let’s assume that the gap reflects approximately the average of those four brands. We can find that average using colMeans() on the brands’ rows, and then take the difference of Epson from that average:

<img width="590" alt="Screenshot 2024-03-06 at 10 17 59 PM" src="https://github.com/apoorvadudani/Principal-Component-Analysis-/assets/113878059/03b4b1bc-7639-4bb1-8bcd-31b0bf6882b5">

This suggests that brand Epson could target the gap by increasing its emphasis on performance while reducing emphasis on “latest” and “fun.”


