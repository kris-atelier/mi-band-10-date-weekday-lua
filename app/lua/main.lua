local lvgl = require("lvgl")
local dataman = require("dataman")

-- Mi Band 10 Date Weekday Lua
-- This is a standalone date/weekday face, separate from the binary clock.
local BACKGROUND = 0x000000
local TEXT_COLOR = 0xFFFFFF
local SUNDAY_COLOR = 0xFF3B30
local SATURDAY_COLOR = 0x248BFF
local FONT_NAME = "Helvetica-Bold"

local root = lvgl.Object(nil, {
    x = 0,
    y = 0,
    w = lvgl.HOR_RES(),
    h = lvgl.VER_RES(),
    bg_color = BACKGROUND,
    bg_opa = lvgl.OPA(100),
    border_width = 0,
    pad_all = 0,
})
root:clear_flag(lvgl.FLAG.SCROLLABLE)

local dateLabel = lvgl.Label(root, {
    x = 0,
    y = (lvgl.VER_RES() // 2) - 70,
    w = lvgl.HOR_RES(),
    h = 62,
    text = "----    --.--",
    text_font = lvgl.Font(FONT_NAME, 48),
    text_color = TEXT_COLOR,
    text_align = lvgl.ALIGN.CENTER,
    bg_opa = 0,
    border_width = 0,
})

local weekdayLabel = lvgl.Label(root, {
    x = 0,
    y = (lvgl.VER_RES() // 2) + 8,
    w = lvgl.HOR_RES(),
    h = 90,
    text = "Wednesday",
    text_font = lvgl.Font(FONT_NAME, 68),
    text_color = TEXT_COLOR,
    text_align = lvgl.ALIGN.CENTER,
    bg_opa = 0,
    border_width = 0,
})

local weekdays = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
local weekdayColors = {
    SUNDAY_COLOR,
    TEXT_COLOR,
    TEXT_COLOR,
    TEXT_COLOR,
    TEXT_COLOR,
    TEXT_COLOR,
    SATURDAY_COLOR,
}

local function updateDate()
    local now = os.date("*t")
    dateLabel:set { text = string.format("%04d    %02d.%02d", now.year, now.month, now.day) }
    weekdayLabel:set {
        text = weekdays[now.wday] or "Weekday",
        text_color = weekdayColors[now.wday] or TEXT_COLOR,
    }
end

updateDate()
dataman.subscribe("dateDay", root, function()
    updateDate()
end)

pageOnPause = function() end
pageOnResume = function()
    updateDate()
end
