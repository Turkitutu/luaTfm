local itemsName = {{"fur", "s"}, {"head", "h"}, {"eyes", "y"}, {"ears", "e"}, {"mouth", "m"}, {"neck", "n"}, {"hair", "d"}, {"tail", "t"}, {"contacts", "c"}, {"hand", "hd"}}

function getLookTable(look)
    local fur, n = look:match('^(.+);(.*)')
    local items = {}
    items["fur"] = {id = fur}
    local id = 2
    for item in n:gmatch('[^,]+') do
        local colors = {}
        if item:find('_') then
            local str_colors = ""
            item, str_colors = item:match('^(%d+)_(.*)')
            for color in str_colors:gmatch('[^%+]+') do
                table.insert(colors, color)
            end
        end
        items[itemsName[id][1]] = {id = item}
        if #colors ~= 0 then
            items[itemsName[id][1]].colors = colors
        end
        id = id + 1
    end
    return items
end

function dressroomUrl(look)
    local url = "https://projects.fewfre.com/a801/transformice/dressroom/?"
    for key, value in next, itemsName do
        local item = look[value[1]]
        if item.id ~= 0 then
            url = url .. value[2].."="..item.id
            if (item.colors) then
                url = url..";"..table.concat(item.colors, ";")
            end
            url = url.."&"
        end
    end

    return url:sub(1, #url-1)
end


local look = getLookTable("134;198,35,59,70,25,37_f8f1de+fbe8b0+f5ce91,38_ffa6be+ff7ca4+5cd6fc+fee8eb+ff7ca4,26,8_fee8eb+5cd6fc+5cd6fc")
print(dressroomUrl(look))
