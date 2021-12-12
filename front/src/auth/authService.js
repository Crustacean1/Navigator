
const url = "http://localhost:8000";
export async function loginUser(credensials) {
    return fetch(`${url}/verification`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(credensials)
    });
}
