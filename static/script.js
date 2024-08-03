async function analyzeSentiment() {
    const review = document.getElementById('review').value;
    if (review === "") {
        alert("Please enter a review to continue");
        return; // To stop further execution if the review is empty
    }
    const response = await fetch('http://44.211.176.242:5000/predict', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ review: review })
    });
    const data = await response.json();
    document.getElementById('result').innerText = `Sentiment: ${data.sentiment}`;
}