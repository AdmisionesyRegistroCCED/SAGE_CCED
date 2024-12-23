// Initialize the agent at application startup.
const fpPromise = import('https://openfpcdn.io/fingerprintjs/v4')
    .then(FingerprintJS => FingerprintJS.load());

// Get the visitor identifier when you need it.
fpPromise
    .then(fp => fp.get())
    .then(result => {
        // Este es el identificador único del visitante:
        const visitorId = result.visitorId;
        console.log('Visitor ID:', visitorId);

        // Enviar el fingerprint al servidor
        fetch('src/controllers/save-fingerprint.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ fingerprint: visitorId })
        })
            .then(response => response.json())
            .then(data => {
                // Manejar la respuesta del servidor
                console.log('Respuesta del servidor:', data);
            })
            .catch(error => {
                console.error('Error al enviar el fingerprint:', error);
            });
    })
    .catch(error => console.error('Error al obtener el fingerprint:', error));
