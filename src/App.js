import React,{useState,useEffect} from 'react';



function App() {
  const [data, setData] = useState([{}]);
  useEffect(() => {
    fetch('https://testbackfront-d2cnhqd7b8d8guga.brazilsouth-01.azurewebsites.net')
      .then((response) => response.json())
      .then((data) => {
        setData(data);
        console.log(data);
      });
  }, []); // Dependency array added

  return (
    <div>
      <h1>Members</h1>
      <h2>no son tood los miembtos</h2>
      {data.members ? (
        <ul>
          {data.members.map((member, index) => (
            <li key={index}>{member}</li>
          ))}
        </ul>
      ) : (
        <p>Loading...</p>
      )}
    </div>
  );
}

export default App;
