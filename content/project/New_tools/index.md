---
date: "2020-04-27T00:00:00Z"
external_link: ""
image:
  caption: A possible workflow to combine FEA + GM + PMCs https://bit.ly/2xd0UE5
  focal_point: Smart
  author: admin
links:
- icon: twitter
  icon_pack: fab
  name: Follow
  url: https://twitter.com/ThomasPuschel
summary: One of my long-standing aims is to understand the relationship between form and ecological function. In order to do this, some colleagues and I are currently developing new methods and approaches in comparative functional morphology to contribute towards this effort.
tags:
- New tools
- FEA
- morphometrics
- machine-learning
title: New morpho-functional tools
url_code: ""
url_pdf: "https://www.research.manchester.ac.uk/portal/files/87763690/FULL_TEXT.PDF"
url_slides: ""
url_video: ""
---
## New tools to analyse primate form and function in an evolutionary framework


Analysing the correlation between form and ecological function is not only relevant to understanding the morphological diversity observed in extant species, but also because it allows us to infer past behaviours in palaeobiological contexts. Given the inherent difficulty of this topic, to elucidate the association between form and function in an ecological and evolutionary context it is necessary to coherently apply a combination of diverse methods, derived from several disciplines such as evolutionary biology, quantitative genetics, biomechanics, phylogenetic comparative techniques, multivariate statistics and ecology, among others. I am collaborating with different colleagues to develop tools and workflows in the following sub-topics:

•	**Combining finite element analysis (FEA), geometric morphometrics (GM) and phylogenetic comparative methods (PCMs)**: One of my long-standing methodological aims is to understand the relationship between form and ecological function in diverse skeletal elements belonging to different primate clades taking into account their phylogenetic relatedness and using state-of-the-art in silico techniques. My aim is to provide an understanding of the role of functional performance in the evolution of morphological form in different anthropoid groups and ascertain the influence of ecological function on skeletal morphology. Therefore, I have been developing different pipelines to combine GM to quantify shape, FEA to analyse function, and PCMs to contextualise the obtained results in an evolutionary and ecomorphological framework. These workflows allow me to explicitly test hypotheses regarding the role of functional factors in the evolution of morphological diversity. 

{{< figure library="true" src="frontiers2.jpg" title="Principal component analyses of shape and stress data. https://doi.org/10.3389/feart.2020.00079" lightbox="true">}}

•	**New statistical tools to analyse FEA outputs**: In computational biomechanics, FEA has become increasingly popular because of its ability to show the biomechanical behaviour of anatomical structures. The results obtained using FEA are commonly expressed as colour maps or as summary statistics, but they do not easily enable a quantitative performance comparison between similar structures, and do not fully exploit the results obtained from FEA. We have are developing different techniques to enable the quantitative comparison of FEA results from several specimens in a multivariate statistical framework. {{% staticref "files/tutorial_intervals.Rmd" "newtab" %}} Click here to know more.{{% /staticref %}}

{{< figure library="true" src="INTER.jpg" title="PCAs of interval data. https://doi.org/10.7717/peerj.3793" lightbox="true">}}

•	**Taxonomic applications of machine-learning algorithms to analyse fragmentary palaeoanthropological materials**: I have recently started a new collaboration to analyse Kenyan paleoanthropological fragmentary remains that although highly important, remain difficult to diagnose due to their fragmented nature. Hence, we have started to analyse these fossils using 3D morphometrics and a sophisticated battery of machine-learning classification algorithms in order to provide a taxonomic identity to these remains.


•	**Development of new dental ecometrics to reconstruct the African late Miocene/early Pliocene environment**:  As teeth are the most common mammalian remains found in the fossil record, many studies have used them as source of palaeoecological information. Among the promising approaches applied to interpreting palaeoclimate from dental remains, there is a method known as ‘dental ecometrics’. This refers to the study of tooth functional traits that have a relationship with climate or environmental gradients at the community level. This research will generate innovative automated ecometric models to reconstruct the paleoenvironments of the African late Miocene/earliest Pliocene using more complex 3D dental variables and machine-learning regression methods. I was awarded a Boise Fund grant to carry out this project.  

{{< figure library="true" src="bovid.jpg" title="Antelope species richness in Sub-Saharan Africa" lightbox="true">}}