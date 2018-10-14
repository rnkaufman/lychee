# lychee

Lychee is soon to be an app that can look at packaged food items and return whether or not they fit within a certain dietary restriction. Currently I plan to have it support veganism, though it'd be cool for other use cases too such as vegetarian, nut-free, or gluten-free.

An example use case is picking up a box of Chao slices and returning whether or not it is vegan. It is, and Mac 'n' Chao is amazing.

TODO:
- Analyze ingredients based on restrictions
- Build an iOS app and wire up ingredient search + ingredient analyzation
- Add OCR for figuring out what the food packaging says

Done:
- Hook into USDA food composition API to return a list of ingredients for a given food item
