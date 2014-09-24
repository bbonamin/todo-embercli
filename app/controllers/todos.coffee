`import Ember from 'ember'`

TodosController = Ember.ArrayController.extend
  actions:
    createTodo: ->
      title = @get 'newTitle'
      todo = @store.createRecord 'todo', 
        title: title
        isCompleted: false
      
      todo.save().then =>
        @set 'newTitle', ''

`export default TodosController`
