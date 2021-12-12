const url = "http://localhost:8000";

export async function getData(token) {
    const response = await fetch(`${url}/monthlyreport`, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${token}`
        }
    }).then((response) => response.json())
        .then((data) => console.log(data));
}
