# Aegyptos

A Flutter mobile application for translating Ancient Egyptian Hieroglyphs in English and Arabic with the feature of listening to their pronunciations 

## Getting Started

This mobile application has the feature of capturing an image or live scanning the walls of temples to be processed using image segmentation techniques such as Otsu Thresholding and among techniques like Contour Detection to seperate the characters in the image to be passed to the classifier as single characters. Also, some Deep Learning algorithms are used such as Squeezenet to help with the classification after segmentation. A matching algorithm was built from dictionaries to get the nearest translation of these set of characters in order to translate Hieroglyphs as full sentences. The last feature is the ability to listen to the pronunciation of these Hieroglyphs.
