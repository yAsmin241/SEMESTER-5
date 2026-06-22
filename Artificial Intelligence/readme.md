# SECJ3533 Artificial Intelligence — Reflection
---

## Assignment 1 — Knowledge Representation

Assignment 1 introduced me to the formal side of AI thinking — translating real-world educational scenarios into structured logical rules. Designing five knowledge representations for the Smart Education system, from the Student Knowledge Profile to the Instructor and Class Analytics, pushed me to think carefully about what exactly a system needs to "know" in order to make decisions. Writing the IF-THEN production rules first and then converting them into First Order Logic predicates was a useful two-step process: the rules felt intuitive, but the FOL translation forced precision and exposed ambiguities I hadn't noticed. I found the Adaptive Difficulty Progression Tracker the most interesting to design, because it had to account for multiple performance trajectories simultaneously — struggling, improving, and advanced students all behaving differently within the same rule system.

---

## Assignment 2 — State Space Search

This assignment made me think about an AI system not just as a set of rules, but as something that navigates a space of possible situations to reach a goal. Mapping the Smart Education Assistance flow as a state space graph — from `student_data_input` through proficiency evaluation, module assignment, engagement checks, and finally `lecturer_notification` — clarified how search problems work in practice: you define states, legal transitions, and a goal, and the system finds a path. Formalizing the action set with functions like `S(state) = {action: next_state}` was a new way of thinking that initially felt mechanical, but made the logic of the system much more transparent. The most valuable insight was realizing that the goal state isn't just "student learns something" but something specific and observable — in our case, the system successfully notifying a lecturer — which is the kind of precision AI problems actually require.

---

## Assignment 3 — Intelligent Agent

Framing the Smart Education system as a PEAS model — Performance, Environment, Actuators, Sensors — gave me a much cleaner vocabulary for describing what an AI agent actually does versus what it knows. Breaking down the system into five specialized agents (Diagnostic & Analysis, Personalized Content, Trial Exam Generator, Progress Tracking, and Equity & Corrective Action) and mapping each one to its own PEAS representation showed me how a complex system can be decomposed into focused, independently describable components. The Learning Agent Architecture diagram with the feedback loop between sensors, the learning element, the critic, and actuators was particularly eye-opening — it showed how an agent doesn't just react to the current state but continuously refines its own behavior based on outcomes. Connecting each agent back to a specific system goal at the end made the whole design feel cohesive rather than just a collection of parts.

---

## Final Project — Smart Education Assistance (Group 3)

The final project brought together everything from Assignments 1 to 3 into a single, coherent AI system proposal, and the integration was the most challenging and rewarding part. Starting from a design thinking empathize map and a defined problem statement grounded the technical work in real user needs — the frustration of students who don't know what they're weak in, and lecturers overwhelmed by manual tracking. Building the full report meant revisiting and refining our knowledge representations, state space, and PEAS model together, and the inconsistencies between them became visible only when they had to coexist in one document. The Proof of Concept section in particular pushed the group to think concretely about how the system would behave end-to-end, from data ingestion through trial exam generation to lecturer alerts, which made the design feel genuinely feasible rather than theoretical.

---

## Overall Reflection

The Artificial Intelligence course gave me a new way of thinking about problem-solving: not just writing code that works, but formally specifying what a system should know, what states it can be in, what goals it is trying to reach, and how it should behave as an agent in a changing environment. Starting from symbolic knowledge representation, then moving through search and finally intelligent agents, the course built each concept on top of the previous one in a way that felt deliberate. Applying all three consistently to the same Smart Education theme across assignments meant I was always working with familiar context, which made it easier to focus on the AI concepts themselves rather than re-learning the domain each time. Coming from a data engineering background, I found the symbolic and logic-based side of AI refreshingly different from the statistical and pipeline-oriented work I'm used to, and the two perspectives feel genuinely complementary now.
