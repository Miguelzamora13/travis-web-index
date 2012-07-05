@Travis.Views.reopen
  RepositoriesView: Em.View.extend
    templateName: 'repositories/list'

  RepositoriesItemView: Em.View.extend
    repositoryBinding: 'context'

    classes: (->
      $.compact(['repository', @get('color'), @get('selected')]).join(' ')
    ).property('color', 'selected')

    color: (->
      Travis.Helpers.colorForResult(@getPath('repository.lastBuildResult'))
    ).property('repository.lastBuildResult')

    selected: (->
      'selected' if @getPath('repository.selected')
    ).property('repository.selected')

    urlRepository: (->
      Travis.Urls.repository(@getPath('repository.slug'))
    ).property('repository.slug')

    urlLastBuild: (->
      Travis.Urls.build(@getPath('repository.slug'), @getPath('repository.lastBuildId'))
    ).property('repository.slug', 'repository.lastBuildId')

  RepositoryView: Em.View.extend
    templateName: 'repositories/show'
    repositoryBinding: 'controller.repository'

    urlGithub: (->
      Travis.Urls.githubRepository(@getPath('repository.slug'))
    ).property('repository.slug'),

    urlGithubWatchers: (->
      Travis.Urls.githubWatchers(@getPath('repository.slug'))
    ).property('repository.slug'),

    urlGithubNetwork: (->
      Travis.Urls.githubNetwork(@getPath('repository.slug'))
    ).property('repository.slug'),
