import 'package:levelupapp/Models/post_model.dart';
import 'package:levelupapp/Models/user_model.dart';

class DemoValues {
  static final List<UserModel> users = [
    UserModel(
      id: "1",
      name: "Active Bulgarian Society",
      email: "abs@gmail.com",
      homeCountry: "Bulgaria",
      image: "assets/images/default-pic.png",
    ),
    UserModel(
      id: "2",
      name: "Lyuben",
      email: "lyuben.zarev@gmail.com",
      homeCountry: "Bulgaria",
      image: "assets/images/default-pic.png",
    ),
    UserModel(
      id: "3",
      name: "Isabella",
      email: "izibizi@gmail.com",
      homeCountry: "USA",
      image: "assets/images/default-pic.png",
    ),
  ];

  static final List<PostModel> posts = [
    PostModel(
      id: "1",
      author: users[0],
      title: "Youth Exchange",
      summary: "'Promoting Inclusion and Employment through Art'\n21.01.2021 - 30.01.2021 \nBrebu, Romania",
      body: "📌GOALS AND OBJECTIVES:\n"
            "\n- Supporting organization of various events (e.g. Independence Day, Christmas, Grandmother’s Day, International Party etc.);"
            "\n- Preparing and delivering workshops for children in accordance with the capacity and skills of volunteers and the needs of schools/kindergartens;"
            "\n- Preparing afterschool activities;"
            "\n- In the case of integrating facilities – supporting disabled children in dressing up, washing hands, eating meals, etc.;"
            "\n- Preparing integrational games and pro-ecological activities;"
            "\n- Creating and taking care of the garden together with kids;"
            "\n- Preparing activities in European Corner to teach children about EU values;"
            "\n- International reading for younger kids;"
            "\n- Participating in the meetings in the office and meetings with mentors;"
            "\n- Filling monthly reports;"
            "\n- Sharing ideas and cooperating."
            "\n\n📌PARTICIPANT PROFILE:"
            "\nThe Group of 13 volunteers already includes people from Spain, France, Ukraine, islands of Runion and Tenerife."
            "\n\nApart from the volunteers, you will meet:"
            "\nProject coordinator - a person who works at the regional volunteer centre and manages the project. The coordinator is responsible for things like logistics and supervision of the project."
            "\nSchool coordinator - a teacher who works in the school. It’s a first-person to contact, as you will meet with the teacher almost on a daily basis. The teacher will be responsible for organizing the work of a volunteer, and for contacting the regional volunteer centre."
            "\nMentor - someone that will take care of the progress of the volunteers and learning process, on regular meetings"
            "\nMate - a young local volunteer, that helps with everyday things and with integration with the local community."
            "\nAccountant - who will deal with all financial matters regarding the project."
            "\nSending partner - an organization from the volunteers’ country, that will help with everything before departure and will be a contact person in case of troubles."
            "\n\n📌VENUE:"
            "\nThe project is going to be in Kielce, Poland."
            "\n\n📌ACCOMMODATION:"
            "Y\nou will have your own room in a flat shared with other volunteers."
            "\n\n📌COSTS AND REIMBURSEMENT:"
            "\nPocket money and food money: until the 5th of each month (except for the first month, where you will receive money as soon as you’ll have a polish bank account - usually it takes less than one week to do this) you will receive 220 euro (120 euro of pocket money and 100 euro for food). You will receive it via bank transfer to your polish bank account."
            "\nBus card: you will have a free bus card to move around in Kielce and surroundings if you’ll be going somewhere further (due to your duties on the project), we will return the money."
            "\nTravel reimbursement: we will return you the money for your travel to and back from the project :) The money for the way to Kielce will be returned in the 9th month of the project, and the money for the tickets to go back - after fulfilling all the formalities. Keep in mind we will return the money up to the limit for a round trip starting from Bulgaria and return back to Bulgaria."
            "\n\n📌TRAVEL GRANT: 275€"
            "\n\n📌HEALTH INSURANCE:"
            "\nYou will have a CIGNA insurance, that you can use in cases of emergencies."
            "\n\n📌DEADLINE FOR APPLYING:  25-10-2020"
            "\nThere is no participation fee. ",

      imageURL: "assets/images/brebu.jpg",
      postTime: DateTime(2020, 10, 1),

    ),
    PostModel(
      id: "2",
      author: users[1],
      title: "ESC Long-term project - Active Education",
      summary: "01.11.2020-31.08.2021 \nKielce, Poland",
      body: "ABS offers you an amazing opportunity to work with children in one of the regional schools, "
          "kindergartens or in the creative common room. You can change the local community, "
          "by showing and teaching solidarity, multiculturalism, tolerance and European values. "
          "You can develop in many areas, you can find your path in life, you can change for the better. "
          "All is in your hands. You will live through the best moments of your life. "
          "And the host organisation will provide you with the support and mentoring need",
      imageURL: "assets/images/kielce.jpg",
      postTime: DateTime(2020, 9, 11),

    ),
    PostModel(
      id: "3",
      author: users[0],
      title: "Short-term Volunteering in Vietnam",
      summary: "Amazing opportunity for 2 or more weeks!",
      body: "📌 CSDS International is a Vietnamese non-profit organisation legally registered in 2009. "
          "CSDS is addressing development issues in Vietnam with particular focuses on climate change for environment protection, "
          "women empowerment through sustainable livelihood support, children support through social inclusion, "
          "youth development through international exchange and non-formal education."
          "\n\n📌THE MAIN ACTIVITIES:  you will have the opportunity to select what you want to do:"
          "\n➢Teaching English or French"
          "Volunteers will work in a Vietnamese school or community centre to assist primary, secondary and high school students with their education. Volunteers will help to improve the children's pronunciation, assist local teachers in managing their classes, organize games and other activities in the classroom, and help to improve the children's listening and speaking skills."
          "\n➢Caring For Disabled ChildrenVolunteers have the opportunity to work in institutions caring for children and young people affected by Agent Orange or in schools and community clinics looking after mentally disabled children.  Typical examples of jobs and tasks can include; assisting local staff in providing rehabilitation exercises and therapist treatments for children, playing with children andentertaining/educating them with games, music, arts and other exercises, helping to develop fundraising initiatives to ensure ongoing funding for these institutions and teaching English to local staff."
          "\n➢Working with Local NGOs"
          "\nVolunteers' roles will vary dependent on the type of organization they work with but typical work can include; writing proposals and reports, improving staff's English and communication skills, assisting with fundraising initiatives and networking with international partners."
          "\n\n📌VOLUNTEER'S PROFILE:"
          "\nVolunteers must be passionate with volunteer work, positive and over 18 years of age at the beginning of the program and have at least a high school education."
          "\n\n📌ACCOMMODATION"
          "\nVolunteers stay in shared room of 4-6-8 volunteers in volunteer house (dorm). The dorms are a popular and a very sociable option as you get to live and socialise with other volunteers and Vietnamese staff. Living conditions in the dorms are basic. There is hot water, washing machine, airconditioning in summer and flushing toilets but you cannot expect to live in a hotel. Males and females are accommodated in separate floors. Dorms are located almost in Hanoi suburd, about 30 minutes from the city centre."
          "\n\n📌FOOD"
          "\nVolunteers will be provided with 3 meals a day, Vietnamese food. Vegetarian food can be provided but if you have too strict diet, it is suggested to bring along some supplemental food for you."
          "\n\n📌START AND DURATION OF PROGRAMS"
          "\nPlacements usually begin on the first and third Wednesday of the month. Volunteers can choose to volunteer for periods of two weeks above."
          "\n\n📌FINANCIAL CONDITIONS"
          "\nFor the first 2 weeks, it is USD 400. For each week after, it is USD 100 added. This program fee covers for: "
          "\n- Food "
          "\n-Accomodation "
          "\n- Local transportation "
          "\n- Airport pick up "
          "\n- Orientation "
          "\n- City tour "
          "\n- Logistics support"
          "\nThere is EUR 100 participation fee after approval."
          "\n\n📌TRAVEL"
          "\nThe volunteer is solely responsible for arranging and paying for their own travel, specifically including all airfares or other transport costs to and from the host country as well as any local transport costs. It is the responsibility of the volunteer to carry all necessary documents when travelling abroad. While we may advise the volunteer on required travel documentation, we are not responsible for any supporting documents necessary for the volunteer's travel needs or other purposes."
          "\nFrom each European capital it will cost approximately EUR 400 for a round trip to Vietnam."
          "\n\n📌INSURANCE"
          "\nWe do not provide the volunteer with insurance of any kind. While travel insurance is mandatory to volunteer in this project. The volunteer is solely responsible for evaluating and determining the type, extent and levels of any insurance coverage they need or desire for their planned volunteer travel period."
          "\n\n📌VISA Please, check the following link: https://en.wikipedia.org/wiki/Visa_policy_of_Vietnam"
          "\n\n📌PAY ATTENTION This is not an Erasmus+ project and  travel and organization costs are covered by the participants."
          "\n\n📌There is no deadline for applying. The call is open all year long."
          "\n\n❓If you have any questions, contact us: absociety.info@gmail.com",

      imageURL: "assets/images/vietnam.jpg",
      postTime: DateTime(2020, 10, 11),
    ),
  ];
}