function showCenter ()  {
    document.getElementById('about__body--center').style.display = 'block';
    document.getElementById('about__body--team').style.display = 'none';
    document.getElementById('about__body--venues').style.display = 'none';
    document.getElementById('about__navigation').style.color = 'white';
}

function showTeam ()  {
    document.getElementById('about__body--center').style.display = 'none';
    document.getElementById('about__body--team').style.display = 'block';
    document.getElementById('about__body--venues').style.display = 'none';
    document.getElementById('about__navigation').style.color = 'black';
}

function showVenues ()  {
    document.getElementById('about__body--center').style.display = 'none';
    document.getElementById('about__body--team').style.display = 'none';
    document.getElementById('about__body--venues').style.display = 'block';
    document.getElementById('about__navigation').style.color = 'black';
}