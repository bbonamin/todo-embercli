`import Ember from 'ember'`

TodoController = Ember.ObjectController.extend
  actions:
    editTodo: ->
      @set 'isEditing', true
    acceptChanges: ->
      @set 'isEditing', false
      if Ember.isEmpty(this.get('model.title'))
        this.send 'removeTodo'
      else
        this.get('model').save()
    removeTodo: ->
      todo = this.get('model')
      todo.deleteRecord()
      todo.save()

`export default TodoController`
