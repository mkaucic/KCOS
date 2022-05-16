function showCenter ()  {
    document.getElementById('about__body--center').style.display = 'block';
    document.getElementById('about__body--team').style.display = 'none';
    document.getElementById('about__body--venues').style.display = 'none';
    document.getElementById('button__center').style.color = 'white';
    document.getElementById('button__team').style.color = 'white';
    document.getElementById('button__venues').style.color = 'white';
    document.getElementById('button__center').style.opacity = '100%';
    document.getElementById('button__team').style.opacity = '40%';
    document.getElementById('button__venues').style.opacity = '40%';
}

function showTeam ()  {
    document.getElementById('about__body--center').style.display = 'none';
    document.getElementById('about__body--team').style.display = 'block';
    document.getElementById('about__body--venues').style.display = 'none';
    document.getElementById('button__center').style.color = 'black';
    document.getElementById('button__team').style.color = 'black';
    document.getElementById('button__venues').style.color = 'black';
    document.getElementById('button__center').style.opacity = '40%';
    document.getElementById('button__team').style.opacity = '100%';
    document.getElementById('button__venues').style.opacity = '40%';
}

function showVenues ()  {
    document.getElementById('about__body--center').style.display = 'none';
    document.getElementById('about__body--team').style.display = 'none';
    document.getElementById('about__body--venues').style.display = 'block';
    document.getElementById('button__center').style.color = 'black';
    document.getElementById('button__team').style.color = 'black';
    document.getElementById('button__venues').style.color = 'black';
    document.getElementById('button__center').style.opacity = '40%';
    document.getElementById('button__team').style.opacity = '40%';
    document.getElementById('button__venues').style.opacity = '100%';
}