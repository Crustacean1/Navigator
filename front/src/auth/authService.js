
const url = "http://localhost";
export async function loginUser(credensials) {
    return fetch(`${url}/api/verification`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(credensials)
    });
}
