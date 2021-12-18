%This program implements inheritance of properties by subcategories and instances, depicted in Property_Inheritance.png.
%Additionally it count the edges between the searches points.

% X is subcategory of Y:
subcategory_of(clownfish,fish).
subcategory_of(fish,animal).
subcategory_of(penguin,bird).
subcategory_of(owl,bird).
subcategory_of(bird,animal).


% X category has Y property:
category_property(clownfish,is_orange).
category_property(clownfish,is_small).
category_property(fish,has_fins).
category_property(fish,has_gills).
category_property(fish,can_swim).
category_property(penguin,can_swim).
category_property(penguin,likes_snow).
category_property(owl,flies_at_night).
category_property(owl,big_eyes).
category_property(bird,has_wings).
category_property(bird,has_feathers).
category_property(animal,has_skin).
category_property(animal,can_move).
category_property(animal,breathes).
category_property(animal,eats_food).


% X is an instance of Y:
instance_of(nemo,clownfish).
instance_of(kowalski,penguin).

% X instance has Y property: 
instance_property(nemo,finds_Dory).
instance_property(nemo,travels).
instance_property(kowalski,can_write).
instance_property(kowalski,intelligent).
instance_property(kowalski,inventor).

% Rules:
% Subcategory tree, constructed with transitivity: subcategory/3
subcategory(X,Y,1) :- subcategory_of(X,Y).

% Recursion
subcategory(X,Y,E) :- subcategory_of(X,Z), 
    subcategory(Z,Y,N), E is N+1.

% Inheritance of direct properties: has_property/3
has_property(X,Y,1) :- instance_property(X,Y).
has_property(X,Y,1) :- category_property(X,Y).

% Inheritance of category properties:
%by instances:
has_property(X,Y,E) :- instance_of(X,Z),
    has_property(Z,Y,N), E is N+1.
	
%by subcategories:
has_property(X,Y,E) :- subcategory_of(X,Z),
    has_property(Z,Y,N), E is N+1.

%Possible queries:
%Which properties does "nemo" have and how far are they from the intsance?
%has_property(nemo,X,N).

%Who has the property "has_fins" and how far are they from this property?
%has_property(X,has_fins,N).

