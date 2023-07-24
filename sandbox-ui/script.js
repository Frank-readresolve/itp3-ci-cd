const target = document.getElementById("target");

const url = "http://localhost:8080/";

async function getData() {
    const envResponse = await fetch("./env.json");
    const envJson = await envResponse.json();
    const url = envJson.URL_BACK;
    const options = {
        method: "get"
    }
    const response = await fetch(url, options);
    const data = await response.json();
    target.innerHTML = data;
    console.log(data);
}