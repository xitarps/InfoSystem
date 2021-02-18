function set_toggles(){
  document.querySelector('#customSwitch_admin_toggle').addEventListener('change',(evt)=>{
    document.querySelector('#btn_send_toggle_admin').click()
  });
  
  document.querySelector('#customSwitch_ban_toggle').addEventListener('change',(evt)=>{
    document.querySelector('#btn_send_toggle_ban').click()
  });
}

document.addEventListener('turbolinks:load', () => {
  set_toggles();
});