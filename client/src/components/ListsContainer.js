import React, { Component } from 'react';
import axios from 'axios';
class ListsContainer extends Component {
	constructor(props){
		super(props)
		this.state = {
			lists: []
		}
	}
	componentDidMount() {
		axios.get('http://localhost:3000/users')
		.then(response => {
			console.log(response)
			console.log(response)
			this.setState({
					lists: response.data
			})
		})
		.catch(error => console.log(error))
	}
	render() {
		return (
			<div className="Lists-container">
				Lists
			</div>
		)
	}
}
export default ListsContainer;