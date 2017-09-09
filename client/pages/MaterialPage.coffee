React = require('react')
import fetch from 'isomorphic-fetch'

import { Grid } from 'react-bootstrap'
import Material from '../components/Material'
import callApi from '../lib/callApi'

class MaterialPage extends React.Component
    constructor: (props) ->
        super(props)
        @state = props.data || window.__INITIAL_STATE__ || {}

    render:  () ->
        return
            <Grid fluid>
                {@state.material && `<Material {...this.state}/>`}
            </Grid>

    componentDidMount: ->
        @reload()

    componentDidUpdate: (prevProps, prevState) ->
        if (prevProps.match.params.id != @props.match.params.id)
            @reload()

    componentWillUnmount: ->
        clearTimeout(@timeout)

    reload: ->
        data = await MaterialPage.loadData(@props.match)
        @setState(data)

    reloadAndSetTimeout: ->
        try
            await @reload()
        catch
            console.log "Can't reload data"
        @timeout = setTimeout((() => @reloadAndSetTimeout()), 20000)

    @loadData: (match) ->
        material = await callApi 'material/' + match.params.id
        tree = await callApi 'material/tree'
        news = await callApi 'material/news'
        return
            material: material
            tree: tree
            news: news

export default MaterialPage