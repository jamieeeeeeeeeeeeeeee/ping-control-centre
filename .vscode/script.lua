print("Hello World!");
drawRectangle(0, 0, 0.5, 0.5, 1, 0, 0);

while true do
  drawDisplay();
end

function handleKeyEvent(key, scancode, action, mods)
  print("Key:", key, "Scancode:", scancode, "Action:", action, "Mods:", mods)
end