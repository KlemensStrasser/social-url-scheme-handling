# Social profile URL handling

A simple `URL` extension for opening Bluesky and Mastodon profiles in different client apps, like `Ivory`, `Radiant` or `Skeets`, depending on what the user has installed. If none is installed, this will open the profile in the browser.

## Setup:

1. Add the `source/SocialURLHandling` folder to your project
2. Add the all client apps you want to support to your `LSApplicationQueriesSchemes`  array in your `Info.plist`.  You can also copy the array from `source/Info.plist`

## Usage

### Bluesky

Call: `URL.blueskyProfileURL(for: "PROFILENAME")`.
Example: `URL.blueskyProfileURL(for: "strasser.bsky.social")`

### Mastodon

Call: `URL.mastodonProfileURL(for: "PROFILENAME")`
Example: `URL.mastodonProfileURL(for: "klemensstrasser@mastodon.social")`

## Supported Apps

### Bluesky:
- Bluesky
- Skeets

### Mastodon:

- Mastodon
- Ivory
- Radiant

## Open Topics

- Add additional client apps
- Check the format of the profile

## License
`social-url-scheme-handling` is available under the Apache-2.0 license.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
	FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
	COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
	IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
