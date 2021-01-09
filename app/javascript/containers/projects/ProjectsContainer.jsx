import React from 'react'
import axios from 'axios'
import ProjectIndex from '../../components/projects/ProjectIndex'
class ProjectsContainer extends React.Component {
	constructor(props) {
		super(props)
		this.state = {
			projects: []
		}
	}
	componentDidMount() {
		this.loadProjectsFromServer()
	}

	loadProjectsFromServer() {
		axios
			.get('projects.json')
			.then(response => {
				const { projects } = response.data
				this.setState({ projects })
			})
			.catch(error => console.log(error.response.data))
	}

	render() {
		const { projects } = this.state
		const projectsList = projects.map(
			project => <ProjectIndex key={project.id} project={project} />
		)

		return (
			<div className="">
				{ projectsList}
			</div>
		)				
	}
}

export default ProjectsContainer