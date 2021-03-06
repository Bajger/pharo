"
An object to control the visibility and properties of inspections. 
It will be passed to the objects defining the inspections, in case they implement the method defined in `StInspectionContext>>#contextMethodSelector`.

## Example
If you define a method `Object>>#inspectionMeta`, you can define a context method `Object>>#inspectionMetaContext:`.
"
Class {
	#name : #StInspectionContext,
	#superclass : #Object,
	#instVars : [
		'inspectedObject',
		'active',
		'title',
		'order',
		'methodSelector',
		'evaluator'
	],
	#category : #'NewTools-Inspector-Model'
}

{ #category : #'instance creation' }
StInspectionContext class >> fromPragma: aPragma [

	^ self new 
		fromPragma: aPragma;
		yourself
]

{ #category : #accessing }
StInspectionContext >> active: aBoolean [

	active := aBoolean
]

{ #category : #accessing }
StInspectionContext >> beActive [

	self active: true
]

{ #category : #accessing }
StInspectionContext >> beInactive [

	self active: false
]

{ #category : #accessing }
StInspectionContext >> contextMethodSelector [

	^ (self methodSelector, 'Context:') asSymbol
]

{ #category : #accessing }
StInspectionContext >> evaluator: aBoolean [

	evaluator := aBoolean
]

{ #category : #initialization }
StInspectionContext >> fromPragma: aPragma [

	self
		order: (aPragma argumentAt: 1);
		title: (aPragma argumentAt: 2);
		methodSelector: aPragma methodSelector
]

{ #category : #testing }
StInspectionContext >> hasEvaluator [

	^ evaluator
]

{ #category : #initialization }
StInspectionContext >> initialize [

	super initialize.
	active := true.
	evaluator := true
]

{ #category : #accessing }
StInspectionContext >> inspectedObject [

	^ inspectedObject
]

{ #category : #accessing }
StInspectionContext >> inspectedObject: anObject [

	inspectedObject := anObject
]

{ #category : #testing }
StInspectionContext >> isActive [

	^ active
]

{ #category : #accessing }
StInspectionContext >> methodSelector [
	^ methodSelector
]

{ #category : #accessing }
StInspectionContext >> methodSelector: aSelector [

	methodSelector := aSelector
]

{ #category : #factory }
StInspectionContext >> newInspectionView [

	^ (self inspectedObject perform: self methodSelector) asInspection
		context: self;
		yourself
]

{ #category : #accessing }
StInspectionContext >> order [
	^ order
]

{ #category : #accessing }
StInspectionContext >> order: aNumber [

	order := aNumber
]

{ #category : #accessing }
StInspectionContext >> title [
	^ title
]

{ #category : #accessing }
StInspectionContext >> title: anObject [
	title := anObject
]

{ #category : #accessing }
StInspectionContext >> withEvaluator [

	self evaluator: true
]

{ #category : #accessing }
StInspectionContext >> withoutEvaluator [

	self evaluator: false
]
