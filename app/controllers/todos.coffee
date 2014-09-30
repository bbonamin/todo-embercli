`import Ember from 'ember'`

TodosController = Ember.ArrayController.extend
  remaining: (->
    @filterBy('isCompleted', false).get('length')
    ).property('@each.isCompleted')
  inflection: (->
    completedNumber = @get('remaining')
    if completedNumber == 1
      'todo'
    else
      'todos'
      ).property('remaining')
  completed: (->
    @filterBy('isCompleted').get('length')
    ).property('@each.isCompleted')
  
  hasCompleted: (->
    @get('completed') > 0
    ).property('completed')
  actions:
    createTodo: ->
      title = @get 'newTitle'
      todo = @store.createRecord 'todo', 
        title: title
        isCompleted: false
      
      todo.save().then =>
        @set 'newTitle', ''
    
    clearCompleted: ->
      todosToClear = @filterBy('isCompleted')
      todosToClear.invoke('deleteRecord')
      todosToClear.invoke('save')

`export default TodosController`
