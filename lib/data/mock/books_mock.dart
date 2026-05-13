import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/book.dart';

const List<Book> mockFeaturedBooks = [
  Book(
    id: '1',
    title: 'Atomic Habits',
    author: 'James Clear',
    imageUrl: 'https://m.media-amazon.com/images/I/91bYsX41DVL._AC_UF1000,1000_QL80_.jpg',
    readCount: '358.2k',
    headline: 'Build habits that actually stick',
    firstColor: Color(0xFFf1bfa6),
    secondColor: Color(0xFFe6946d),
    themeColor: Colors.blueAccent,
    description:
        'Ever feel stuck repeating the same patterns? In Atomic Habits, '
        'James Clear shows how tiny changes create massive progress by redesigning '
        'your environment and identity, not relying on discipline. Learn how small '
        'improvements compound into breakthroughs.',
    keyIdeasCount: 13,
    timePerIdea: '4-5 min',
  ),
  Book(
    id: '2',
    title: 'The Power of Now',
    author: 'Eckhart Tolle',
    imageUrl: 'https://m.media-amazon.com/images/I/91eGsYabODL._AC_UF894,1000_QL80_.jpg',
    readCount: '71.3k',
    headline: 'Wake up to the only moment that matters',
    firstColor: Color(0xFFe5cda2),
    secondColor: Color(0xFFd0ac6a),
    themeColor: Colors.amberAccent,
    description:
        'Eckhart Tolle teaches that true peace comes from living fully in '
        'the present moment rather than being trapped by thoughts of past or future.',
    keyIdeasCount: 10,
    timePerIdea: '3-4 min',
  ),
  Book(
    id: '3',
    title: 'Ego Is The Enemy',
    author: 'Ryan Holiday',
    imageUrl: 'https://m.media-amazon.com/images/I/71z70m5r7OL._AC_UF1000,1000_QL80_.jpg',
    readCount: '89.8k',
    headline: 'Master yourself before mastering anything else',
    firstColor: Color(0xFFa5d4f5),
    secondColor: Color(0xFF6eb7ee),
    themeColor: Colors.cyanAccent,
    description:
        'Ryan Holiday explores how ego is the enemy of every aspiration — '
        'from ambition to success to greatness.',
    keyIdeasCount: 11,
    timePerIdea: '4-5 min',
  ),
  Book(
    id: '4',
    title: 'Make It Stick',
    author: 'Peter C. Brown',
    imageUrl: 'https://m.media-amazon.com/images/I/81v0NxNkKSL.jpg',
    readCount: '55.1k',
    headline: 'Transform how you learn with science-backed techniques that actually work',
    firstColor: Color(0xFFdcc6f4),
    secondColor: Color(0xFFc19eec),
    themeColor: Colors.purpleAccent,
    description:
        'Researchers show that common study habits are ineffective. '
        'This book reveals counterintuitive strategies proven to boost long-term retention.',
    keyIdeasCount: 9,
    timePerIdea: '3-4 min',
  ),
  Book(
    id: '5',
    title: 'The Barefoot Investor',
    author: 'Scott Pape',
    imageUrl:
        'https://images.squarespace-cdn.com/content/v1/5eb4889e5e47b4255c41009e/5a9071ed-f597-4cc9-a3ef-46827bbe97b4/Barefoot+Kids+-+Front+Cover.jpg',
    readCount: '39.5k',
    headline: 'Build wealth with simple steps that actually work',
    firstColor: Color(0xFFe2d1a0),
    secondColor: Color(0xFFcab068),
    themeColor: Colors.greenAccent,
    description:
        'Scott Pape lays out a simple, step-by-step plan for financial freedom '
        'that anyone can follow — no jargon, no complexity.',
    keyIdeasCount: 8,
    timePerIdea: '3-4 min',
  ),
  Book(
    id: '6',
    title: 'Sapiens',
    author: 'Yuval Noah Harari',
    imageUrl: 'https://api.chulabook.com/images/pid-5025.jpg',
    readCount: '39.3k',
    headline: 'Discover how shared stories conquered the world',
    firstColor: Color(0xFFf1bea5),
    secondColor: Color(0xFFe6936c),
    themeColor: Colors.orangeAccent,
    description:
        'Harari explores the history of humankind — how Homo sapiens came to '
        'dominate the Earth and what shared fictions make our societies possible.',
    keyIdeasCount: 14,
    timePerIdea: '5-6 min',
  ),
  Book(
    id: '7',
    title: 'The Art of Thinking Clearly',
    author: 'Rolf Dobelli',
    imageUrl: 'https://m.media-amazon.com/images/I/71z-Dx8B20L.jpg',
    readCount: '80.7k',
    headline: 'Recognize cognitive traps and make smarter decisions',
    firstColor: Color(0xFFe5cda2),
    secondColor: Color(0xFFd1ad6b),
    themeColor: Colors.tealAccent,
    description:
        'Dobelli catalogs 99 cognitive biases and logical fallacies that '
        'distort our thinking every day, with clear examples of how to spot and avoid them.',
    keyIdeasCount: 12,
    timePerIdea: '4-5 min',
  ),
];

const List<Book> mockRecommendBooks = [
  Book(
    id: '8',
    title: 'Unlimited Power',
    author: 'Tony Robbins',
    imageUrl: 'https://m.media-amazon.com/images/I/71OJtpj-zLL._AC_UF1000,1000_QL80_.jpg',
    themeColor: Colors.amber,
    description: 'Tony Robbins reveals the science of peak performance and shows how to unleash the power within yourself.',
    keyIdeasCount: 10,
    timePerIdea: '4-5 min',
  ),
  Book(
    id: '1',
    title: 'Atomic Habits',
    author: 'James Clear',
    imageUrl: 'https://m.media-amazon.com/images/I/91bYsX41DVL.jpg',
    themeColor: Colors.blueAccent,
    description:
        'James Clear reveals how tiny changes create remarkable results through the compound effect of habits.',
    keyIdeasCount: 13,
    timePerIdea: '4-5 min',
  ),
  Book(
    id: '9',
    title: 'Deep Work',
    author: 'Cal Newport',
    imageUrl: 'https://m.media-amazon.com/images/I/71pqZChaJkL.jpg',
    themeColor: Colors.redAccent,
    description:
        'Cal Newport argues that the ability to focus without distraction is the superpower of the 21st century.',
    keyIdeasCount: 8,
    timePerIdea: '3-4 min',
  ),
];
