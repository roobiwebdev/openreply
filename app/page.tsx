import { redirect } from "next/navigation";

// Toonwright runs this privately: the public marketing page is not needed.
export default function Home() {
  redirect("/login");
}
