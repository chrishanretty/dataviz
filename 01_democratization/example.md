---
title: "Basic presentation template"
author: "Chris Hanretty"
date: "A date here"
output:
  xaringan::moon_reader:
    css: ["default", "rhul.css", "rhul-fonts.css","https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css"]
    nature:
          highlightLines: true
---




# A basic slide

- This is a series of list items
- The list is presented without content
- and void...
- Note how the bullet point is styled in RHUL orange
- You can style text using class `brick-orange`, like I've done for .brick-orange[this text]
- Body text is set in a very dark grey.

---

# Numbered lists

1. This is an ordered list.
2. You can see how the list numerals are styled.
3. There's not much more to it than that.

---

# Complex lists

 - This list contains lists
     * I always struggle with how these lists are handled in Markdown
     * Maybe you will have better luck than me
 - This list item has as a descendant an ordered list.
     1. Here's list item number one
	 2. And two, and so on...
	 3. Until we reach a nice stopping point
 - That was fun, wasn't it?
 
 
---

# Slide class options

 - There are two slide classes you may want to use.
 - One is class `inverse`, which has a nice `rhul-blue` background (`#334150`).
 - The other is `section-slide`, which has the same background, but uses a vertical strip and background like `title-slide`

---

class: inverse

# A slide with class inverse

This slide illustrates the inverse class.

It has text in a range of formats.

*Here is text between single asterisks*.

**Here is text between double asterisks**.

The `brick-orange` colour, which is used for text set in `<em>` and
`<strong>` (markdown's single and double asterisks) works well when
set on this background.

---

class: section-slide

# A slide with class section-slide

---

class: section-slide

# A slide with class section-slide and an extra-long section title which looks ugly

---

# A slide with a block quote

There are two more design elements, for block-quotes and warnings

> "Here's the block quote. What do you think of it?"

Here we see some text set in the `alert` class:

.alert[You should always use 4:3 ratio for presentations]

---

# Font choices

 - Royal Holloway's preferred font is Ideal Sans, which works really
   well at light weights and as body text.
 - The fall-back font is Corbel, which is common on systems with
   Microsoft Office.
 - Accordingly, the basic font is Corbel, with the system default
   sans-serif as a backup.
 - The heading font, however, is Raleway, which just works really well
   in light weights.
 - Pre-formatted text is set in `Source Code Pro (2019)`.
 
---

# This page has pulls

.pull-left[
this section is in pull-left. It's a copy of the default one.
]
.pull-right[
This bit is in pull-right. It doesn't have a border.
]

---

class: animated, fadeIn

# This page has columns

.left-column[
This is a left column.  It's narrow.
]
.right-column[
This text isn't in a class of its own.
]

---

class: animated, fadeIn

# This page has *emphasis* and **bold text**

This text is set in *italics*.

---

class: animated, fadeIn

# Here's a slide that moves in

I've set this using the `animated` and `fadeIn` classes.
