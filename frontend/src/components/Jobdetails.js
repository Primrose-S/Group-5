import React, { useState } from 'react';

function Jobdetails({ job }) {
  const [showDescription, setShowDescription] = useState(false);

  const toggleDescription = () => {
    setShowDescription(!showDescription);
  };

  return (
    <div>
      <h2>{job.title}</h2>
      <p>Location:johannesburg {job.location}</p>
      <p>Category: {job.category}</p>
      <button onClick={toggleDescription}>
        {showDescription ? 'Hide Details' : 'Show Details'}
      </button>
      {showDescription && <p>Description: {job.description}</p>}
    </div>
  );
}

export default Jobdetails;
