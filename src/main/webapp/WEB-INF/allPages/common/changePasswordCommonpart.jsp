
<div class="buyer-register">
  <div class="formContainer">
    <h1>Change Password</h1>
    <p>Fill the below form to change Password.</p>
    <div id="instructions"></div>
    <div id="error" style="color: red; font-weight: bold"></div>
    <form action="changePassword" method="post" id="form">
      <div class="row">
        <div class="column">
          <label for="currentPassword">Enter Current Password of Account:</label>
          <input
                  id="currentPassword"
                  type="password"
                  name="currentPassword"
                  required
          />
        </div>
      </div>
      <div class="row">
        <div class="column">
          <label for="newPassword">Enter New Password for Account:</label>
          <input
                  id="newPassword"
                  type="password"
                  name="newPassword"
                  required
          />
        </div>
        <div class="column">
          <label for="newPassword2">Re-Enter New Password for Account:</label>
          <input
                  id="newPassword2"
                  type="password"
                  name="newPassword2"
                  required
          />
        </div>
      </div>
      <input type="submit" value="Change Password" class="sub-btn">
    </form>
  </div>
</div>
