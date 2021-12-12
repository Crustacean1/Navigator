const url = "http://localhost:8000";

export async function getData(token) {
    return await fetch(`${url}/monthlyreport`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            token: token,
            month: "04",
            year: "2021"

        })
    });
}
