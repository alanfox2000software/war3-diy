local reactivity = require("reactivity");

print(reactivity.computed)
print(reactivity.reactive)
print(reactivity.ref)


local computed,ref,reactive = reactivity.computed,reactivity.ref,reactivity.reactive

local count = ref(0)
print(count.value);

count.value = 2;
print(count.value)

local plusOne = computed(function ()
    return count.value + 2;
end)
print(plusOne.value)
count.value = 5;
print(plusOne.value)



local obj = reactive({count = 4});
obj.count = 5;

print(obj.count)
