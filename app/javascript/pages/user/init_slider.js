
const initSlider = () => {

  const rating = {
    1: 'Much better than usual',
    2: 'Better than usual',
    3: 'Same as usual',
    4: 'Worse than usual',
    5: 'Much worse than usual'
  }

    let ratingInput = document.getElementById('rating-slider')

    ratingInput.addEventListener('change', () => {
      let sliderText = document.getElementById('slider-text')
      let severity = ratingInput.value
      sliderText.innerHTML = rating[severity]
    })
}

export { initSlider };
