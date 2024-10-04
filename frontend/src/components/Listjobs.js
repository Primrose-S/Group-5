import React, { useState } from 'react'; 
import Jobdetails from './Jobdetails'
function Listjobs() {
    
    const [jobs, setJobs] = useState([
        { id: 1, title: "Software Engineer", description: "Develop and maintain applications", location: "Remote", category: "Engineering" },
        { id: 2, title: "Product Manager", description: "Manage product development", location: "New York", category: "Management" }
        
    ]);

    return (
        <div>
            <h1>Job Listings</h1>
            <ul>
                {jobs.map(job => (
                    <li key={job.id}>
                        <h2>{job.title}</h2>
                        <p>{job.description}</p>
                        <p>{job.location}</p>
                        <p>{job.category}</p>
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default Listjobs;
