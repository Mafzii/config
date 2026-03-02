---
name: graphic-realism
description: Use when the user requests graphic realism, sci-fi, gaming, dark cinematic, neon, futuristic, or immersive UI designs. Triggers on keywords like "graphic realism", "sci-fi aesthetic", "gaming landing page", "dark cinematic UI", "neon interface", "futuristic design", "immersive layout", "cyberpunk", "HUD-style".
---

# Graphic Realism — Dark Cinematic Sci-Fi Frontend Aesthetic

You are generating frontend code in a **dark, cinematic, immersive sci-fi gaming aesthetic** — the visual language of titles like Marathon, Destiny, Cyberpunk, and Halo. Every output must feel like a AAA game's marketing site: atmospheric, high-contrast, and unapologetically dramatic.

---

## Color System

- **Base blacks:** `#0A0A0A`, `#050505`, `#000000`. Never use white, pastel, or unsaturated gray backgrounds.
- **Bold saturated dark backgrounds:** Use these chromatic dark backgrounds on **at least 1–2 sections per page** to create visual rhythm instead of uniform black:
  - Deep space navy: `#0A1628` / `#0D1B2A`
  - Void crimson: `#1A0508` / `#2A0A10`
  - Nebula violet: `#120A1E` / `#1A0E2A`
  - Dark teal: `#081A1A` / `#0A2424`
  - Ember dark: `#1A1008` / `#2A1A0C`
  - Signal green-black: `#0A1A0A` / `#0C240C`
- **Neon accents at full saturation:** Accents must appear at **full saturation** on key elements (buttons, headings, borders, interactive states). Never use accents below `rgba(..., 0.1)` opacity on primary design elements — accents must be visible and intentional. Accents **must** follow color theory (complementary, analogous, or triadic pairings):
  - Cyan `#00F0FF` + Magenta `#FF00FF`
  - Green `#00FF41` + Amber `#FFB800`
  - Electric Blue `#0066FF` + Neon Orange `#FF6600`
  - Violet `#8B00FF` + Lime `#CCFF00`
- **Color hierarchy (mandatory):**
  - **Dominant (60%):** The primary dark background tone (black or saturated dark)
  - **Secondary (25%):** A contrasting section background or primary accent at high visibility
  - **Accent (15%):** The complementary/triadic pop color for highlights and interactive states
  - Every page must use **at least 3 colors** from a chosen color theory scheme, not just 2.
- **No mid-tone grays** for key UI elements — use near-black or near-white only.
- **Dark gradient overlays** on all media (`linear-gradient(to bottom, rgba(0,0,0,0.7), rgba(0,0,0,0.9))`).

## Section Background Palette

Alternate between pure black and these saturated dark backgrounds to create visual pacing. Each section boundary should feel like entering a new environment.

| Name              | Primary     | Variant     | Use case                        |
|-------------------|-------------|-------------|---------------------------------|
| Deep space navy   | `#0A1628`   | `#0D1B2A`   | Hero sections, tech content     |
| Void crimson      | `#1A0508`   | `#2A0A10`   | Danger, conflict, action CTAs   |
| Nebula violet     | `#120A1E`   | `#1A0E2A`   | Mystery, lore, narrative blocks |
| Dark teal         | `#081A1A`   | `#0A2424`   | Data displays, terminals        |
| Ember dark        | `#1A1008`   | `#2A1A0C`   | Warmth, community, legacy       |
| Signal green-black| `#0A1A0A`   | `#0C240C`   | Status, success, live feeds     |

Apply these as `background-color` on full-width sections. Layer with subtle radial gradients for depth (e.g., `radial-gradient(ellipse at center, #0D1B2A, #050505)`).

## Typography

- **Headers:** ALL-CAPS, `letter-spacing: 0.1em` to `0.3em`, large display sizes (`clamp(2.5rem, 6vw, 6rem)`+), tight `line-height: 0.9–1.1`.
- **Typefaces:** Geometric/futuristic sans-serifs only:
  - Display: `Rajdhani`, `Orbitron`, `Exo 2`, `Chakra Petch`, `Bruno Ace`, `Audiowide`
  - Data/stats/mono: `JetBrains Mono`, `Space Mono`, `Fira Code`
- Import from Google Fonts. Never fall back to generic system font stacks without a futuristic primary.
- Body text in light gray (`#E0E0E0` or `#CCCCCC`) on dark — never pure white for paragraphs.

## Layout

- **Hero:** Full-bleed video or image with dark overlay, centered dramatic headline, minimal CTA below.
- **Sections:** Modular vertical sections alternating between media-heavy and text-heavy blocks. **Sections must visually contrast** with each other through background color shifts (using the Section Background Palette), not just content changes. Each section boundary should feel like entering a new environment.
- **Negative space:** Generous padding/margins to create tension and focus (`py-24`, `py-32` equivalent).
- **Navigation:** Fixed/sticky, minimal, semi-transparent or glass-effect. Logo left, sparse links right.
  - **Link arrows:** Wrap in square brackets, styled as a single inline unit matching the link font:
    ```css
    .nav-link::after { content: ' [↗]'; font-family: inherit; opacity: 0.5; transition: none; }
    .nav-link:hover::after { opacity: 1; color: var(--accent); }
    ```
  - **Dropdown arrows:** Same treatment: `[↓]` with matching font and accent color on hover.
  - Brackets + arrow must use the same monospace/futuristic font as the link text, rendered as a single inline unit. Never use bare Unicode arrows without bracket wrapping.
- **Imagery:** Edge-to-edge, with SVG decorative frames, angular clip-paths, or border overlays.
- **Grid-breaking:** Asymmetric compositions — offset images, text overlapping media, diagonal dividers.

## Effects & Overlays

- **Scan-line / noise grain:** CSS `::before` or `::after` pseudo-elements with repeating-linear-gradient or SVG noise filter, `pointer-events: none`, low opacity (0.03–0.08).
- **Neon glow (intensified):** `box-shadow: 0 0 40px rgba(accent, 0.6), 0 0 80px rgba(accent, 0.3)` on key elements. `text-shadow` glow on headings at `0 0 40px` minimum. Ghost-level `0 0 20px` glows are too subtle for primary elements.
- **Glass panels:** `backdrop-filter: blur(12px)` with `bg-opacity` or `rgba` semi-transparent backgrounds.
- **Clip-path cuts:** Angular/geometric section dividers (`clip-path: polygon(...)`) — beveled corners, diagonal slashes.
- **Parallax:** Scroll-driven parallax on hero backgrounds and layered elements.
- **Layered animated backgrounds:** Background effects must be **layered and animated**, not just static gradients. Combine CSS animations, canvas elements, and ASCII overlays for depth.
- **Color-wash section backgrounds:** Sections should have visible gradient backgrounds in saturated dark hues — use `radial-gradient(ellipse at 30% 50%, rgba(0, 240, 255, 0.08), transparent 60%)` or stronger. Never use invisible-level tints like `rgba(..., 0.03)` as the only section coloring.
- **ASCII-canvas hybrids:** Canvas elements rendering ASCII characters (dots, slashes, brackets) as animated background layers — matrix rain, star fields, radar sweeps.

## Motion & Animation

- **Scroll reveals:** Staggered `fade-in` + `translate-y` on scroll (use Intersection Observer or CSS `animation-timeline`). 100–200ms stagger between elements.
- **Hover glitch:** Glitch/flicker effect on interactive elements — CSS `clip-path` + `transform` jitter, RGB channel split via offset `text-shadow` in red/cyan.
- **Snap interactions (simple hover/focus states):** Text color changes, border color changes, background color swaps, opacity toggles, and glow appearance on hover/focus must be **instant or near-instant** — use `transition: none` or `transition-duration: 50ms` max with `step-end` / `linear` timing. These should feel like a HUD snapping to a new state, not a slow crossfade. This applies to: nav link hover colors, button background swaps, card border reveals, icon color shifts, and similar single-property state toggles. Never use `ease`, `ease-in-out`, or durations above 50ms for these.
- **Cinematic transitions (layout & entrance motion):** 600ms+ duration, `ease-out` or custom cubic-bezier for **scroll reveals, parallax, page transitions, element entrances, and multi-property transform sequences**. These are the atmospheric, deliberate motions. This does NOT apply to simple hover color/border/glow state changes — those use snap interactions above.
- **Ambient:** Pulsing glow keyframes on accent elements (`@keyframes pulse-glow`), subtle particle effects if appropriate.

## ASCII & Text Effects (Mandatory — minimum 3 distinct ASCII elements per page)

Every page must include **at least 3 distinct ASCII art elements** from the categories below. ASCII is not optional decoration — it is a core visual layer of this aesthetic.

### ASCII Animated Backgrounds
Full-viewport `<canvas>` or `<pre>` based ASCII animations layered behind content at low opacity (0.05–0.15). Examples:
- **Matrix rain:** Vertical cascading characters (katakana, Latin, symbols) in columns
- **Star fields:** `.` `*` `+` `·` characters drifting or twinkling across the viewport
- **Cascading code:** Scrolling monospace code fragments as atmospheric texture
- **Radar sweeps:** Rotating patterns using `/` `|` `\` `-` characters in a circular arrangement

### ASCII Section Borders & Frames
Large decorative ASCII frames around key sections using box-drawing and special characters:
```
╔══════════════════════════════════════════════╗
║                                              ║
╚══════════════════════════════════════════════╝
```
```
┌──────────── ◆ SECTION TITLE ◆ ────────────┐
│                                              │
└──────────────────────────────────────────────┘
```
Circuit-board patterns, corner brackets (`┌┐└┘`), and tech-frame decorations. These should be visually substantial, not just thin `───` dividers.

### ASCII Art Illustrations
Thematic ASCII art relevant to the page content rendered in `<pre>` blocks. Use as hero decorations, section accents, or background elements:
- Spaceships, weapons, helmets for gaming/sci-fi
- Skulls, insignias, logos for branding
- Circuit patterns, chip layouts for tech
- Planetary systems, constellations for space themes
- Scale these to be visually impactful — at least 5–10 lines tall

### ASCII Hover & Interaction Effects
Interactive ASCII reactions triggered on hover or click:
- Characters scattering outward from cursor position
- Ripple effects in monospace character grids
- Terminal-style feedback lines appearing (`> ACCESSING...`, `> GRANTED`)
- Character substitution animations (letters cycling through symbols before settling)

### ASCII Loading & Transition Animations
Between sections or on scroll, ASCII-based transitions:
- Characters assembling letter-by-letter into words
- Block character wipe effects using `█▓▒░` progression
- Dissolve effects — characters breaking into dots then reforming
- Scan-line sweeps revealing content character by character

### ASCII Data Visualizations
Display stats and numbers with ASCII-based visual elements:
- Bar charts: `[████████░░░░] 67%`
- Sparklines: `▁▂▃▅▇█▇▅▃▂▁`
- Progress indicators: `[████░░░░░░] 40%`
- Loading spinners: cycling through `|` `/` `-` `\`
- Stat blocks styled as terminal readouts

### Core Text Effects
- **Scramble-to-reveal:** Headings animate by randomizing characters (A-Z, symbols) then resolving to real text character-by-character. Implement with JS `requestAnimationFrame` loop.
- **Typewriter:** Text appears character-by-character with a blinking cursor (`|` or `_`). Monospace font for this effect.
- **Glitch text:** CSS-only glitch using `::before`/`::after` pseudo-elements with `clip-path: inset()` animation and slight `transform: translate()` offsets + color channel separation via text-shadow.
- **Terminal blocks:** Monospace text sections styled as console output — green-on-black or amber-on-black with a blinking cursor and `> ` prompt prefix.

## Components

- **Buttons:** Angular/beveled — use `clip-path` for cut corners or angled edges. Never use `border-radius` on primary CTAs. Neon border or glow on hover. Hover state changes (background color, glow, border) must snap instantly (`transition: none` or `50ms` max).
- **Platform CTAs:** Include console/PC icons (SVG) when referencing platform availability. Styled as HUD elements.
- **Cards:** Minimal chrome — no visible borders by default. Dark glass background, accent border snaps on hover (no transition or `50ms` max). Content-first.
- **Data displays:** HUD-style — monospace numbers, label above value, accent-colored key metrics. Think game UI stat panels.
- **Narrative text:** Thematic story/lore text woven into layout — styled differently from UI copy (italic, different weight, slightly transparent).
- **Section dividers:** ASCII-art horizontal rules, SVG angular shapes, or decorative box-drawing character borders. Never just a plain `<hr>`.

## Form & Input Elements

- **Text inputs:** Dark recessed background (`#0A0A0A`), accent-colored bottom-border on focus (snap transition, `50ms` max). Monospace placeholder text in dim gray (`#555`). No `border-radius` — use sharp edges or angular `clip-path` on input containers to match button style.
- **Textareas:** Same rules as text inputs. Accent left-border on focus. Custom scrollbar inside (see Scrollbar Styling).
- **Select dropdowns:** Styled as HUD selectors — dark background, accent border, custom angular dropdown arrow (`[↓]`). Native `<select>` must be visually overridden or replaced with custom dropdown.
- **Checkboxes & radios:** Custom angular toggles — square/diamond shapes for checkboxes, hexagonal or angular for radios. Accent glow on checked state with snap transition. Never use default browser checkboxes.
- **Toggles/switches:** Angular slider track in near-black, accent-filled thumb, snap between states. No rounded pill shapes.
- **File uploads:** Styled as terminal command buttons (`> UPLOAD FILE`) with accent border. Drag-drop zones use dashed accent border with ASCII frame decoration.
- **Labels:** Uppercase monospace, positioned above the field, dim gray (`#888`) default, accent color when field is focused.
- **Validation states:**
  - Error: Crimson accent (`#FF2244`) border, terminal-style error message: `> ERR: Field required`
  - Success: Signal green (`#00FF41`) border, message: `> OK: Valid`
  - Warning: Amber (`#FFB800`) border, message: `> WARN: Check input`
- **Beveled input containers:** Wrap inputs in containers with `clip-path` angular cuts matching the button aesthetic for key form fields (login, search, primary actions).

## Navigation Patterns

Beyond the fixed top nav already defined:

- **Sidebar nav:** Glass panel (`backdrop-filter: blur(12px)`) or solid dark panel (`#0A0A0A`). Accent left-border (`3px solid var(--accent)`) on active item with snap transition. Items in uppercase monospace. Collapsed icon-only mode on mobile with angular toggle button.
- **Tabs:** Angular/beveled tab shapes using `clip-path`. Active tab has accent bottom-border or glow, text at full brightness. Inactive tabs in dim text (`#666`). Tab switching is a snap transition — no slide or fade between tab content.
- **Breadcrumbs:** Monospace text with `>` or `//` separators. Current page in accent color, previous items in dim gray with hover snap to accent. Example: `HOME // DASHBOARD // SETTINGS`
- **Pagination:** Angular button row matching primary button style. Active page has accent fill. Disabled pages at 30% opacity. Previous/next arrows in brackets: `[←]` `[→]`.
- **Command palette / search:** Modal overlay with monospace input, terminal-style results list with `>` prefix on highlighted item. Keyboard-navigable with accent highlight on active result.

## Tables & Data Grids

- **Header row:** Uppercase monospace text, accent bottom-border (`2px solid var(--accent)`), background slightly lighter than table body (`#111`).
- **Alternating rows:** Near-black variants — `#0A0A0A` and `#0F0F0F`. Never use white or light row stripes.
- **Row hover:** Subtle accent border-left snap (`3px solid var(--accent)`) or background shift to slightly lighter dark. Snap transition only.
- **Sortable columns:** Header text with bracket arrows — `COLUMN [↑]` / `COLUMN [↓]`. Active sort column header in accent color. Click to toggle sort is a snap state change.
- **Data cells:** Monospace font for all numeric data. Accent-colored key metrics and important values. Text data in regular body font.
- **Cell alignment:** Numbers right-aligned, text left-aligned, status indicators centered.
- **Table borders:** No full grid borders. Use horizontal rules only — thin (`1px`) in dim gray (`#222`) between rows. Accent border on header bottom.
- **Responsive:** Horizontal scroll with gradient fade edge on mobile (`linear-gradient(to right, transparent, #0A0A0A)` overlay on right edge). Pin first column on narrow screens.
- **Empty table state:** ASCII illustration + dim text (`> NO DATA AVAILABLE`) + optional CTA.

## Modals & Dialogs

- **Panel:** Dark glass panel (`backdrop-filter: blur(16px)`, `background: rgba(10, 10, 10, 0.95)`) centered on viewport. Angular `clip-path` on corners matching button/card aesthetic. Accent border (`1px solid var(--accent)` at reduced opacity).
- **Backdrop:** Dark overlay (`rgba(0, 0, 0, 0.8)`) with optional scan-line effect overlay. Click-to-dismiss on backdrop.
- **Header:** Uppercase display font with accent glow (`text-shadow: 0 0 30px var(--accent)`). Accent bottom-border separator.
- **Close button:** Angular `[X]` in top-right corner, monospace, accent color on hover (snap). Not a rounded circle.
- **Action buttons:** Follow existing button rules — beveled/angular primary CTA, outlined secondary. Right-aligned in footer.
- **Entry animation:** Cinematic entrance — scale from 0.95 to 1.0 + fade in, `300ms ease-out`. Not a bounce or spring.
- **Exit:** Snap dismiss — no slow fade out. `transition: opacity 100ms`.
- **Sizes:** Small (400px), Medium (600px), Large (800px), Full-screen on mobile.

## Toast Notifications & Alerts

- **Style:** Terminal-style toasts — monospace text with `> ` prefix and left accent border (`4px solid`).
- **Position:** Top-right or bottom-right of viewport, stacked vertically with `8px` gap.
- **Color coding by type:**
  - Info: Primary accent color border
  - Success: Signal green (`#00FF41`) border, prefix `> OK:`
  - Error: Crimson (`#FF2244`) border, prefix `> ERR:`
  - Warning: Amber (`#FFB800`) border, prefix `> WARN:`
- **Background:** Dark glass (`rgba(10, 10, 10, 0.95)`) with `backdrop-filter: blur(8px)`.
- **Entry animation:** Slide-in from right, cinematic timing (`400ms ease-out`).
- **Dismiss:** Snap-dismiss on close click (`50ms`). Close button as `[X]` in monospace.
- **Auto-dismiss:** Optional timed dismiss with ASCII progress bar: `[████░░░░]` shrinking in accent color.
- **Stacking:** Maximum 4 visible toasts. Older toasts dismissed when limit reached.

## Loading & Empty States

- **Skeleton screens:** Dark pulsing rectangles (`#111` to `#1A1A1A` pulse) with subtle accent shimmer sweep (`linear-gradient` moving left-to-right). Match the shape of the content they replace. Angular edges, not rounded.
- **Loading overlays:** ASCII spinner centered — cycling through `|` `/` `-` `\` characters in monospace at accent color. Status text below in uppercase monospace: `LOADING...`, `ACCESSING DATABASE...`, `DECRYPTING...`.
- **Full-page loading:** ASCII spinner + thematic loading text + optional ASCII art. Dark background matching page theme.
- **Empty states:** ASCII art illustration (relevant to context) + dim text message in monospace + primary CTA button. Example:
  ```
  ╔══════════════════════╗
  ║   NO RECORDS FOUND   ║
  ╚══════════════════════╝
  > Start by adding your first entry
  [+ CREATE NEW]
  ```
- **Progress bars:** ASCII-style `[██████░░░░] 60%` in monospace, or angular filled bar with accent gradient. Never use rounded progress bars.
- **Inline loading:** Small ASCII spinner (`|` `/` `-` `\`) inline with text or inside buttons. Button text becomes `PROCESSING...` with spinner.

## Scrollbar Styling

Custom scrollbars are mandatory — default browser scrollbars break the aesthetic.

```css
/* WebKit (Chrome, Safari, Edge) */
::-webkit-scrollbar { width: 6px; height: 6px; }
::-webkit-scrollbar-track { background: #0A0A0A; }
::-webkit-scrollbar-thumb { background: rgba(var(--accent-rgb), 0.4); }
::-webkit-scrollbar-thumb:hover { background: rgba(var(--accent-rgb), 0.8); }

/* Firefox */
* { scrollbar-width: thin; scrollbar-color: rgba(var(--accent-rgb), 0.4) #0A0A0A; }
```

- Track: Near-black (`#0A0A0A`), invisible against dark backgrounds.
- Thumb: Accent color at 40% opacity, full opacity on hover (snap transition).
- Width: Thin — `6px` to `8px`. Never thick or default width.
- No rounded ends on scrollbar thumb — keep angular to match aesthetic.

## Focus & Keyboard Accessibility

Never remove focus indicators — restyle them to match the aesthetic.

- **Focus-visible ring:** Accent-colored outline or box-shadow glow replacing default browser focus ring:
  ```css
  :focus-visible {
    outline: none;
    box-shadow: 0 0 0 2px var(--accent), 0 0 12px rgba(var(--accent-rgb), 0.4);
  }
  ```
- **Snap transition** on focus appearance — no slow glow fade-in.
- **Tab order:** Logical and sequential. Test with keyboard navigation.
- **Skip-to-content link:** Styled as terminal command — hidden until focused, then appears as monospace accent text: `> SKIP TO MAIN CONTENT [↓]`.
- **High contrast mode:** Ensure accent borders and focus rings remain visible in forced-colors / high-contrast OS modes.
- **Focus within containers:** When a container (card, panel) receives focus-within, apply subtle accent border to the container.

## Spacing System

Base unit: `0.5rem` (8px). All spacing derives from this scale.

| Token    | Value    | px   | Use case                              |
|----------|----------|------|---------------------------------------|
| `space-1`| `0.25rem`| 4px  | Tight gaps (icon-to-text)             |
| `space-2`| `0.5rem` | 8px  | Inline element spacing                |
| `space-3`| `0.75rem`| 12px | Small component padding               |
| `space-4`| `1rem`   | 16px | Default component padding             |
| `space-6`| `1.5rem` | 24px | Component group spacing               |
| `space-8`| `2rem`   | 32px | Large component padding, card padding |
| `space-12`| `3rem`  | 48px | Section internal padding              |
| `space-16`| `4rem`  | 64px | Small section vertical padding        |
| `space-24`| `6rem`  | 96px | Standard section vertical padding     |
| `space-32`| `8rem`  | 128px| Large section vertical padding        |

- **Section padding:** `4rem` to `8rem` vertical, `1.5rem` to `3rem` horizontal.
- **Component internal padding:** `1rem` to `2rem`.
- **Element gaps in flex/grid:** `0.5rem` to `1.5rem` depending on density.
- **Form field spacing:** `1.5rem` vertical gap between fields, `0.5rem` between label and input.

## Dashboard & Application Layouts

Beyond full-bleed marketing layouts:

- **Sidebar + Content:**
  - Fixed sidebar (`width: 240px` to `280px`, `height: 100vh`, `position: fixed`) in glass or solid dark (`#0A0A0A`).
  - Scrollable content area with `margin-left` matching sidebar width.
  - Sidebar collapses to icon-only (`width: 64px`) on tablet/mobile with angular toggle.
  - Content area uses Section Background Palette for visual zones within the dashboard.

- **Header + Sidebar + Content:**
  - Fixed header (`height: 56px` to `64px`, `z-index: 50`) spanning full width, glass or solid dark.
  - Fixed sidebar below header (`top: 56px`, `height: calc(100vh - 56px)`).
  - Scrollable main content in remaining space.

- **Split Pane:**
  - Vertical or horizontal split with draggable angular divider (`4px` wide, accent color on hover).
  - Divider styled as tech separator: thin line with small angular grip marks in center.
  - Each pane independently scrollable with custom scrollbars.

- **Content panels within layouts:** Use glass or solid dark cards as content containers within the main area. Accent top-border or left-border to denote panel type/priority.
- **Responsive behavior:** Sidebar overlays on mobile as a slide-in panel with dark backdrop. Header remains fixed. Content takes full width.

## Interactive State Tokens

Consistent state system across all components:

| State       | Visual Treatment                                                                 |
|-------------|----------------------------------------------------------------------------------|
| **Default** | Component at normal appearance, no accent emphasis                               |
| **Hover**   | Accent border/glow snap (per-component rules). Cursor: pointer on interactive    |
| **Focus**   | Accent outline/box-shadow glow (see Focus & Keyboard Accessibility)              |
| **Active**  | Slightly shifted position (`transform: translate(1px, 1px)`) or dimmed glow      |
| **Selected**| Accent border or background at full visibility, accent text or icon              |
| **Disabled**| 30% opacity, `pointer-events: none`, no glow, no accent, `cursor: not-allowed`  |
| **Loading** | Pulsing accent glow (`@keyframes pulse-glow`) or inline ASCII spinner            |
| **Error**   | Crimson (`#FF2244`) border/glow replacing accent, error message below            |
| **Success** | Signal green (`#00FF41`) border/glow, confirmation message                       |

- All state transitions follow the snap/cinematic rules: hover/focus/active are snap (`50ms` max), loading animations are cinematic.
- Disabled state overrides all other states — no hover, focus, or active styling when disabled.
- States must be visually distinct without relying on color alone (combine color + border + opacity changes for accessibility).

## Anti-Patterns — NEVER Do These

- No `border-radius` on primary action buttons (angular/beveled only).
- No pastel colors anywhere.
- No white, pastel, or unsaturated gray backgrounds. Dark saturated chromatic backgrounds (deep navy, dark crimson, deep violet) are encouraged.
- No uniform black across all sections — vary background colors using the Section Background Palette to create visual rhythm.
- No invisible/ghost-level accent usage (opacity below 0.1 on key design elements) — accents must be visible and intentional.
- No pages without at least 3 distinct ASCII art elements (dividers, frames, decorative art, or animated backgrounds).
- No generic font stacks (`Arial`, `Helvetica`, `system-ui` alone).
- No evenly-distributed rainbow color palettes — accents must be intentional and paired using color theory.
- No rounded, friendly, or "soft" UI patterns.
- No generic stock photo aesthetics — all imagery should feel cinematic and atmospheric.
- No thin, lightweight typography for headers — bold and heavy weights only.
- No bare Unicode arrows (`↗`, `↓`) next to navigation links — always wrap in brackets (`[↗]`, `[↓]`) and style with the link's font.
- No smooth/slow transitions (`ease`, `300ms+`) on simple hover color, border, or glow state changes — these must snap instantly.
- No default browser scrollbars — custom-styled scrollbars are mandatory on all scrollable containers.
- No default browser focus rings (blue outline) — restyle with accent-colored glow/outline matching the aesthetic.
- No `border-radius` on form inputs, toggles, or any interactive elements — angular/sharp edges only.
- No default browser checkboxes, radios, or select dropdowns — all must be custom-styled.
- No rounded progress bars, toggle switches, or loading spinners — angular and monospace only.
- No modals or dialogs with rounded corners or bounce/spring animations.
- No toast notifications styled as generic rounded cards — use terminal-style with monospace and `>` prefix.
- No unstyled empty states or browser-default loading indicators.
- No spacing that doesn't align to the 8px base unit scale.

## Implementation Notes

- Use Tailwind CSS or vanilla CSS — either is fine. If Tailwind, use `@apply` sparingly and prefer utility classes.
- For Google Fonts, include `<link>` tags or `@import` in CSS.
- All effects must be CSS-first where possible; JS only for scroll-triggered animations, text scramble effects, and ASCII canvas animations.
- Ensure accessibility: all text meets WCAG AA contrast on dark backgrounds (neon on black passes). Include `prefers-reduced-motion` media query to disable animations.
- Responsive: mobile-first, but the full cinematic experience targets large screens.
