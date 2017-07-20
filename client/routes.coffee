React = require('react')
import {
  BrowserRouter as Router,
  Route,
  Link,
  Switch,
  Redirect
} from 'react-router-dom'

import UserBadgePage from './pages/UserBadgePage'
import DashboardPage from './pages/DashboardPage'

class NoMatch extends React.Component 
    render: () ->
        return <h2>404 Not found</h2>

export default [
    { 
        path: '/userBadge/:id',
        key: "userBadge",
        component: UserBadgePage,
        loadData: UserBadgePage.loadData,
    },
    { 
        path: '/dashboard',
        key: "dashboard",
        component: DashboardPage,
        loadData: DashboardPage.loadData,
    },
    { 
        component: NoMatch,
        key: "nomatch"
    },
]
  