async function followVacation(vacationId, btn) {
  try {
    const token = document.querySelector('input[name="__RequestVerificationToken"]').value
    let isActive = btn.classList.contains("active")

    const response = await fetch("/Vacation/Follow", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        RequestVerificationToken: token
      },
      body: JSON.stringify({
        id: vacationId,
        active: isActive
      })
    })

    const responseText = await response.text() // Get the response as text
    console.log("Raw Response:", responseText) // Log the raw response
    console.log(vacationId, isActive)

    // Try to parse the response as JSON
    const result = JSON.parse(responseText)
    if (result.success) {
      console.log(result)

      if (result.active) {
        SuccessFollow(btn)
      } else {
        RemoveFollow(btn)
      }
    }
  } catch (error) {
    console.error("Error:", error)
    alert("An error occurred while processing your request.")
  }
}

function SuccessFollow(FollowBtn) {
  let CountItem = FollowBtn.querySelector(".follow_btn_count")
  let Count = parseInt(CountItem.innerHTML, 10)
  Count = Count + 1
  CountItem.innerHTML = Count
  console.log(FollowBtn)

  FollowBtn.classList.add("active")
}

function RemoveFollow(FollowBtn) {
  let CountItem = FollowBtn.querySelector(".follow_btn_count")
  let Count = parseInt(CountItem.innerHTML, 10)

  if (Count > 0) {
    Count = Count - 1
  }

  CountItem.innerHTML = Count
  FollowBtn.classList.remove("active")
}
