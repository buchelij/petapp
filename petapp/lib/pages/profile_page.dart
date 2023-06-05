import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  "Richie Lorie",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {},
                      heroTag: 'Passport',
                      elevation: 0,
                      label: const Text("Passport"),
                    ),
                    const SizedBox(width: 10.0),
                    FloatingActionButton.extended(
                      onPressed: () {},
                      heroTag: 'Health',
                      elevation: 0,
                      label: const Text("Health"),
                    ),
                    const SizedBox(width: 10.0),
                    FloatingActionButton.extended(
                      onPressed: () {},
                      heroTag: 'Medical',
                      elevation: 0,
                      label: const Text("Medical"),
                    ),
                    const SizedBox(width: 10.0),
                    FloatingActionButton.extended(
                      onPressed: () {},
                      heroTag: 'Vet',
                      elevation: 0,
                      label: const Text("Vet"),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const _ProfileInfoRow()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General Information',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.pets),
              SizedBox(width: 8),
              Text('Breed: Labrador Retriever'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.calendar_today),
              SizedBox(width: 8),
              Text('Age: 3 years'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.info),
              SizedBox(width: 8),
              Text(
                  'Description: Lorem ipsum dolor sit amet,\n consectetur adipiscing elit.'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.monitor_weight),
              SizedBox(width: 8),
              Text('Weith: 5 kg'),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileInfoItem {
  final String title;
  final int value;
  const ProfileInfoItem(this.title, this.value);
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xff0043ba), Color(0xff006df1)]),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
